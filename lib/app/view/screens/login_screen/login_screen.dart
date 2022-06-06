import 'package:clean_architecture/app/view/screens/login_screen/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('LoginScreen'),
              _LoginFormField(
                  title: '이메일',
                  controller: controller.emailCon,
                  obscure: false,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'empty text!';
                    }
                    if (!text.isEmail) {
                      return 'invalid email format';
                    }
                    return null;
                  }),
              _LoginFormField(
                  title: '비밀번호',
                  controller: controller.pswdCon,
                  obscure: false,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'empty text!';
                    }
                    return null;
                  }),
              TextButton(
                child: const Text('이메일 로그인'),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.emailLogin();
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    controller.kakaoLogin();
                  },
                  child: const Text('카카오 로그인')),
              TextButton(
                child: const Text('네이버 로그인'),
                onPressed: () async {
                  await FlutterNaverLogin.logIn();
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login/signup');
                  },
                  child: const Text('회원가입'))
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginFormField extends StatelessWidget {
  const _LoginFormField(
      {Key? key,
      required this.title,
      required this.controller,
      required this.validator,
      required this.obscure})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black))),
      ),
    );
  }
}
