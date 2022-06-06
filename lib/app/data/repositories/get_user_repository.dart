// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/app/data/providers/firestore_provider.dart';
import 'package:clean_architecture/app/domain/repository_interfaces/get_data_repository.dart';

class GetUserRepostiory implements GetDataRepository {
  FirestoreProvider firestoreProvider;
  GetUserRepostiory({
    required this.firestoreProvider,
  });
  @override
  Future<Map<String, dynamic>?> getData(String uid) async {
    final data = await firestoreProvider.getUserFromDb(uid);
    return data;
  }
}
