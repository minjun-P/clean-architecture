import 'package:clean_architecture/app/domain/use_cases/auth/signup_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupController extends GetxController {
  SignupUseCase signupUseCase;

  SignupController({required this.signupUseCase});

  Future<void> signup() async {
    signupUseCase.signup(
        email: emailCon.text,
        password: pswdCon.text,
        data: {'name': nameCon.text});
  }

  final formKey = GlobalKey<FormState>();

  late TextEditingController emailCon;
  late TextEditingController nameCon;
  late TextEditingController pswdCon;
  @override
  void onInit() {
    emailCon = TextEditingController();
    pswdCon = TextEditingController();
    nameCon = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    pswdCon.dispose();
    nameCon.dispose();
    super.onClose();
  }
}
