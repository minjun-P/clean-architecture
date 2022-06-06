import 'package:clean_architecture/app/data/providers/functions_provider.dart';
import 'package:clean_architecture/app/data/repositories/custom_token_repository.dart';
import 'package:clean_architecture/app/data/repositories/fb_login_repository.dart';
import 'package:clean_architecture/app/data/services/kakao_login_service.dart';
import 'package:clean_architecture/app/data/repositories/user_firestore_repository.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/email_login_use_case.dart';
import 'package:clean_architecture/app/domain/use_cases/auth/social_login_use_case.dart';
import 'package:clean_architecture/app/view/screens/login_screen/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    print('로그인 컨트롤러 바인딩');
    Get.put(LoginController(
        emailLoginUseCase:
            EmailLoginUseCase(emailLoginRepository: FbLoginRepository()),
        kakaoLoginUseCase: SocialLoginUseCase(
            socialLoginService: KakaoLoginService(
                userRepository: UserFirestoreRepository(),
                fbLoginRepository: FbLoginRepository(),
                customTokenRepository:
                    CustomTokenRepository(provider: FunctionsProvider())))));
  }
}
