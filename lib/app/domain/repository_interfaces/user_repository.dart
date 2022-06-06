abstract class UserRepository {
  Future<void> uploadUser(
      {required String uid, required Map<String, dynamic> data});
  Future<Map<String, dynamic>?> getUser({required String uid});
}
