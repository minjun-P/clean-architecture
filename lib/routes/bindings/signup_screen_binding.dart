import 'package:clean_architecture/app/data/services/fb_signup_service.dart';
import 'package:clean_architecture/app/data/repositories/user_firestore_repository.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/signup_use_case.dart';
import 'package:clean_architecture/app/view/screens/signup_screen/signup_controller.dart';
import 'package:get/get.dart';

class SignupScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController(
      signupUseCase: SignupUseCase(
        userRepository: UserFirestoreRepository(),
        emailSignupService: FbSignupService(),
      ),
    ));
  }
}
