import 'package:clean_architecture/app/data/providers/interfaces/db_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider implements DbProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> getUserFromDb(String uid) async {
    final document = await _firestore.collection('users').doc(uid).get();
    Map<String, dynamic>? data = document.data();

    return data;
  }

  @override
  Future<void> uploadUserToDb(
      {required String uid, required Map<String, dynamic> data}) async {
    final document = await _firestore.collection('users').doc(uid).get();
    if (!document.exists) {
      await _firestore.collection('users').doc(uid).set(data);
    }
  }
}
