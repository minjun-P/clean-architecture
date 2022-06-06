import 'package:get/get.dart';

import '../app/view/screens/home_screen/home_screen.dart';
import 'bindings/home_screen_binding.dart';
import '../app/view/screens/independent_controller/user_auth_state_controller.dart';
import '../app/view/screens/init_screen/init_screen.dart';
import '../app/view/screens/loading_screen/loading_screen.dart';
import 'bindings/loading_screen_binding.dart';
import '../app/view/screens/login_screen/login_screen.dart';
import 'bindings/login_screen_binding.dart';
import '../app/view/screens/signup_screen/signup_screen.dart';
import 'bindings/signup_screen_binding.dart';

class GetPages {
  static final pages = [
    GetPage(
        page: () => const LoginScreen(),
        name: '/login',
        binding: LoginScreenBinding()),
    GetPage(
        page: () => const SignupScreen(),
        name: '/login/signup',
        binding: SignupScreenBinding()),
    GetPage(
        page: () => const HomeScreen(),
        name: '/home',
        binding: HomeScreenBinding()),
    GetPage(
        page: () => const InitScreen(),
        name: '/',
        binding: BindingsBuilder.put(
          () => AuthStateService(),
        )),
    GetPage(
      page: () => const LoadingScreen(),
      name: '/loading',
      binding: LoadingScreenBinding(),
    )
  ];
}
