import 'package:clean_architecture/app/view/screens/home_screen/home_screen.dart';
import 'package:clean_architecture/routes/bindings/home_screen_binding.dart';
import 'package:clean_architecture/app/view/screens/independent_controller/user_auth_state_controller.dart';
import 'package:clean_architecture/app/view/screens/init_screen/init_screen.dart';
import 'package:clean_architecture/app/view/screens/loading_screen/loading_screen.dart';
import 'package:clean_architecture/routes/bindings/loading_screen_binding.dart';
import 'package:clean_architecture/app/view/screens/login_screen/login_screen.dart';
import 'package:clean_architecture/routes/bindings/login_screen_binding.dart';
import 'package:clean_architecture/app/view/screens/signup_screen/signup_screen.dart';
import 'package:clean_architecture/routes/bindings/signup_screen_binding.dart';
import 'package:clean_architecture/routes/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  KakaoSdk.init(nativeAppKey: 'c78654149944a9b18da36de124aef33f');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: GetPages.pages,
    );
  }
}
