import 'package:clean_architecture/app/view/screens/signup_screen/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '회원가입',
              style: TextStyle(fontSize: 40),
            ),
            _buildSignupForm(
                title: '이름',
                controller: controller.nameCon,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'empty text!';
                  }
                  return null;
                }),
            _buildSignupForm(
                title: '이메일',
                controller: controller.emailCon,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'empty text!';
                  }
                  if (!text.isEmail) {
                    return 'invalid email format';
                  }
                  return null;
                }),
            _buildSignupForm(
                title: '비밀번호',
                controller: controller.pswdCon,
                obscure: true,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'empty text!';
                  }
                  return null;
                }),
            TextButton(
              onPressed: () {
                print(controller.emailCon.text);
                if (controller.formKey.currentState!.validate()) {
                  controller.signup();
                }
              },
              child: const Text('회원가입'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignupForm(
      {required String title,
      required TextEditingController controller,
      required String? Function(String?) validator,
      bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscure,
          ),
        ],
      ),
    );
  }
}
