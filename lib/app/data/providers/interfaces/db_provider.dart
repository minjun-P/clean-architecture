abstract class DbProvider {
  getUserFromDb(String uid);
  Future<void> uploadUserToDb(
      {required String uid, required Map<String, dynamic> data});
}
