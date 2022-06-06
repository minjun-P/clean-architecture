// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/domain/repository_interfaces/email_login_repository.dart';

class EmailLoginUseCase {
  EmailLoginRepository emailLoginRepository;
  EmailLoginUseCase({
    required this.emailLoginRepository,
  });

  login(String email, String password) {
    emailLoginRepository.login(email, password);
  }
}
