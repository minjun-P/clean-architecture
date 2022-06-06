// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/domain/repository_interfaces/get_data_repository.dart';

class GetUserUseCase {
  GetDataRepository getUserRepository;
  GetUserUseCase({
    required this.getUserRepository,
  });

  Future<Map<String, dynamic>?> getUser(String uid) async {
    final userData = await getUserRepository.getData(uid);
    return userData;
  }
}
