import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// ! 전역 컨트롤러
class AuthStateService extends GetxService {
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        print('로그인 안된 상태');
        Get.offAllNamed('/login');
      } else {
        print('로그인된 상태');
        Get.offAllNamed('/loading');
      }
    });
    super.onInit();
  }

  static AuthStateService get to => Get.find<AuthStateService>();

  String get getUid => FirebaseAuth.instance.currentUser!.uid;
}
