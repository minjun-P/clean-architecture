// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/domain/service_interfaces/signup_service.dart';
import 'package:clean_architecture/app/domain/repository_interfaces/user_repository.dart';

class SignupUseCase {
  SignupService emailSignupService;
  UserRepository userRepository;
  SignupUseCase({
    required this.emailSignupService,
    required this.userRepository,
  });

  Future<void> _uploadUser(
      {required Map<String, dynamic> data, required String uid}) async {
    await userRepository.uploadUser(uid: uid, data: data);
  }

  Future<void> signup(
      {required String email,
      required String password,
      required Map<String, dynamic> data}) async {
    final uid = await emailSignupService.signupAndReturnUid(email, password);
    await _uploadUser(data: data, uid: uid);
  }
}
