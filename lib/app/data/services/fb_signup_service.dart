import 'package:clean_architecture/app/domain/service_interfaces/signup_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FbSignupService implements SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<String> signupAndReturnUid(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return credential.user!.uid;
  }
}
