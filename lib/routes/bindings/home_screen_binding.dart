import 'package:clean_architecture/app/data/providers/firestore_provider.dart';
import 'package:clean_architecture/app/data/repositories/fb_logout_repository.dart';
import 'package:clean_architecture/app/data/repositories/get_user_repository.dart';
import 'package:clean_architecture/app/domain/use_cases/get_user_use_case.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/logout_use_case.dart';
import 'package:clean_architecture/app/view/screens/home_screen/home_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
        getUserUseCase: GetUserUseCase(
            getUserRepository:
                GetUserRepostiory(firestoreProvider: FirestoreProvider())),
        logoutUseCase: LogoutUseCase(repository: FbLogoutRepository())));
  }
}
