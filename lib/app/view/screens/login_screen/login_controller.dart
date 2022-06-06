// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clean_architecture/app/domain/use_cases/auth/email_login_use_case.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/social_login_use_case.dart';

class LoginController extends GetxController {
  EmailLoginUseCase emailLoginUseCase;
  SocialLoginUseCase kakaoLoginUseCase;
  SocialLoginUseCase naverLoginUseCase;
  LoginController({
    required this.emailLoginUseCase,
    required this.kakaoLoginUseCase,
    required this.naverLoginUseCase,
  });

  final formKey = GlobalKey<FormState>();

  emailLogin() {
    emailLoginUseCase.login(emailCon.text, pswdCon.text);
  }

  kakaoLogin() async {
    Get.defaultDialog(title: '로딩중', content: const CircularProgressIndicator());
    await kakaoLoginUseCase.login();
    Get.back(closeOverlays: true);
  }

  naverLogin() async {
    Get.defaultDialog(title: '로딩중', content: const CircularProgressIndicator());
    await naverLoginUseCase.login();
    Get.back(closeOverlays: true);
  }

  TextEditingController emailCon = TextEditingController();
  TextEditingController pswdCon = TextEditingController();

  @override
  void onInit() {
    emailCon = TextEditingController();
    pswdCon = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    pswdCon.dispose();

    super.onClose();
  }
}
