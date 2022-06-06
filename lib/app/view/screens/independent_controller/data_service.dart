// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:clean_architecture/app/domain/use_cases/get_user_use_case.dart';
import 'package:clean_architecture/app/view/screens/independent_controller/user_auth_state_controller.dart';

class DataService extends GetxService {
  GetUserUseCase getUserUseCase;
  DataService({
    required this.getUserUseCase,
  });

  static DataService get to => Get.find<DataService>();

  @override
  void onInit() {
    getUser().then((value) {
      userName(value['name']);
      Get.offNamed('/home');
    });
    super.onInit();
  }

  var userName = 'init value'.obs;

  Future<Map<String, dynamic>> getUser() async {
    final uid = AuthStateService.to.getUid;
    var userData = await getUserUseCase.getUser(uid);
    // ! 회원가입 후, 첫 시도시 null 이 뜨는 경우가 있음. 데이터베이스에 올리는 작업이 채 완료되기도 전에 화면이 전환되어서 그럼!
    while (userData == null) {
      print('null!!');
      userData = await getUserUseCase.getUser(uid);
    }
    print('done');

    return userData;
  }
}
