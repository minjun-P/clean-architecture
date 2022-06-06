// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:clean_architecture/app/domain/use_cases/get_user_use_case.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/logout_use_case.dart';

class HomeController extends GetxController {
  LogoutUseCase logoutUseCase;
  GetUserUseCase getUserUseCase;
  HomeController({
    required this.logoutUseCase,
    required this.getUserUseCase,
  });

  logout() {
    logoutUseCase.logout();
  }
}
