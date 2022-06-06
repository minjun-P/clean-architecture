import 'package:clean_architecture/app/data/providers/firestore_provider.dart';
import 'package:clean_architecture/app/data/repositories/get_user_repository.dart';
import 'package:clean_architecture/app/domain/use_cases/get_user_use_case.dart';
import 'package:clean_architecture/app/view/screens/independent_controller/data_service.dart';
import 'package:get/get.dart';

class LoadingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DataService(
        getUserUseCase: GetUserUseCase(
            getUserRepository:
                GetUserRepostiory(firestoreProvider: FirestoreProvider()))));
  }
}
