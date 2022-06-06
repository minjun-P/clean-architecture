// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/domain/repository_interfaces/user_repository.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:clean_architecture/app/core/enums.dart';
import 'package:clean_architecture/app/data/models/social_to_fb_inform.dart';
import 'package:clean_architecture/app/data/repositories/custom_token_repository.dart';
import 'package:clean_architecture/app/data/repositories/fb_login_repository.dart';
import 'package:clean_architecture/app/domain/service_interfaces/social_login_service.dart';

class KakaoLoginService implements SocialLoginService {
  UserRepository userRepository;
  CustomTokenRepository customTokenRepository;
  FbLoginRepository fbLoginRepository;
  KakaoLoginService({
    required this.userRepository,
    required this.customTokenRepository,
    required this.fbLoginRepository,
  });

  @override
  Future<String?> login() async {
    final token = await _kakaoLogin();
    // * 카카오 로그인 과정 잘 마쳤을 때
    if (token != null) {
      final scopes = await _checkPermission();
      if (scopes.isNotEmpty) {
        if (await _requestPermission(scopes) == null) {
          // ! null 리턴하며 종료
          return null;
        }
      }

      SocialToFbInform userInform = await _getUserData();
      final String token =
          await customTokenRepository.getCustomToken(userInform.toMap());
      final String uid = await fbLoginRepository.loginWithCustomToken(token);
      await userRepository
          .uploadUser(uid: uid, data: {'name': userInform.displayName});
      return uid;
    }
    return null;
  }

  Future<OAuthToken?> _kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        // 카카오톡으로 로그인 시도
        print('카카오톡으로 로그인 시도');
        final token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        return token;
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          print('취소버튼 누름');
          return null;
        }
        // ! 카톡은 깔려있는데 계정 로그인이 안되어 있는 경우
        final token = await _loginWithAccount();
        return token;
      }
    }
    // ! 카카오톡 안 깔려있는 경우 처리
    else {
      final token = await _loginWithAccount();
      return token;
    }
  }

  Future<OAuthToken?> _loginWithAccount() async {
    try {
      print('계정으로 로그인 시도');
      final token = await UserApi.instance.loginWithKakaoAccount();
      print('계정으로 로그인 성공');
      return token;
    } catch (error) {
      if (error is PlatformException && error.code == 'CANCELED') {
        print('취소버튼 누름');
        return null;
      }
    }
    return null;
  }

  Future<List<String>> _checkPermission() async {
    User user = await UserApi.instance.me();
    List<String> scopes = [];

    if (user.kakaoAccount?.emailNeedsAgreement == true) {
      scopes.add('account_email');
    }
    if (user.kakaoAccount?.birthdayNeedsAgreement == true) {
      scopes.add("birthday");
    }
    if (user.kakaoAccount?.birthyearNeedsAgreement == true) {
      scopes.add("birthyear");
    }
    if (user.kakaoAccount?.ciNeedsAgreement == true) {
      scopes.add("account_ci");
    }
    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) {
      scopes.add("phone_number");
    }
    if (user.kakaoAccount?.profileNeedsAgreement == true) {
      scopes.add("profile");
    }
    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) {
      scopes.add("age_range");
    }
    if (user.kakaoAccount?.genderNeedsAgreement == true) {
      scopes.add("gender");
    }
    return scopes;
  }

  Future<OAuthToken?> _requestPermission(List<String> scopes) async {
    try {
      OAuthToken token = await UserApi.instance.loginWithNewScopes(scopes);
      print('성공');
      return token;
    } catch (error) {
      print('에러발생 $error');
      return null;
    }
  }

  Future<SocialToFbInform> _getUserData() async {
    User user = await UserApi.instance.me();
    return SocialToFbInform(
        id: user.id.toString(),
        displayName: user.kakaoAccount!.profile!.nickname!,
        email: user.kakaoAccount!.email!,
        platform: SocialPlatform.kakao.toString());
  }
}
