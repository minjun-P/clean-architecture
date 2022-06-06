import 'package:clean_architecture/app/core/enums.dart';
import 'package:clean_architecture/app/data/models/social_to_fb_inform.dart';
import 'package:clean_architecture/app/data/repositories/custom_token_repository.dart';
import 'package:clean_architecture/app/data/repositories/fb_login_repository.dart';
import 'package:clean_architecture/app/domain/repository_interfaces/user_repository.dart';
import 'package:clean_architecture/app/domain/service_interfaces/social_login_service.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class NaverLoginService implements SocialLoginService {
  UserRepository userRepository;
  CustomTokenRepository customTokenRepository;
  FbLoginRepository fbLoginRepository;
  NaverLoginService({
    required this.userRepository,
    required this.customTokenRepository,
    required this.fbLoginRepository,
  });

  @override
  Future<String?> login() async {
    final NaverLoginResult naverLoginResult = await FlutterNaverLogin.logIn();
    if(naverLoginResult.status == NaverLoginStatus.loggedIn){
      NaverAccountResult user = naverLoginResult.account;
      SocialToFbInform userInform = SocialToFbInform(
        id: user.id,
        displayName: user.name,
        email: user.email,
        platform: SocialPlatform.naver.toString()
      );
      final String token = await customTokenRepository.getCustomToken(userInform.toMap());
      final String uid = await fbLoginRepository.loginWithCustomToken(token);
      await userRepository.uploadUser(uid: uid, data: {'name': userInform.displayName});
      return uid;
    }
    return null;
  }

}
