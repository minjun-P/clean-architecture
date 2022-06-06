import 'package:clean_architecture/app/view/screens/independent_controller/data_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(DataService.to.userName.value),
      ),
    );
  }
}
