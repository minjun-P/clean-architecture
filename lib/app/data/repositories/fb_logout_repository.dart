import 'package:clean_architecture/app/domain/repository_interfaces/logout_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FbLogoutRepository implements LogoutRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  logout() {
    _auth.signOut();
  }
}
