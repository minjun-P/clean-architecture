import 'package:clean_architecture/app/domain/repository_interfaces/email_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FbLoginRepository implements EmailLoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print(error);
      Get.snackbar('wrong', 'invalid email/pswd!');
    }
  }

  Future<String> loginWithCustomToken(String token) async {
    final credential = await _auth.signInWithCustomToken(token);
    return credential.user!.uid;
  }
}
