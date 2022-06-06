// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/domain/service_interfaces/social_login_service.dart';

class SocialLoginUseCase {
  SocialLoginService socialLoginService;
  SocialLoginUseCase({
    required this.socialLoginService,
  });

  login() async {
    await socialLoginService.login();
  }
}
