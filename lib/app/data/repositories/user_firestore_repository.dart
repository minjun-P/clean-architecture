import 'package:clean_architecture/app/domain/repository_interfaces/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> getUser({required String uid}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> uploadUser(
      {required String uid, required Map<String, dynamic> data}) async {
    final document = await _firestore.collection('users').doc(uid).get();
    if (!document.exists) {
      await _firestore.collection('users').doc(uid).set(data);
    }
  }
}
