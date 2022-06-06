import 'package:clean_architecture/app/domain/repository_interfaces/logout_repository.dart';

class LogoutUseCase {
  LogoutRepository repository;
  LogoutUseCase({required this.repository});
  logout() {
    repository.logout();
  }
}
