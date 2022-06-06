import 'package:clean_architecture/app/view/screens/home_screen/home_controller.dart';
import 'package:clean_architecture/app/view/screens/independent_controller/data_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('home screen'),
          TextButton(
            child: const Text('로그아웃'),
            onPressed: () {
              controller.logout();
            },
          ),
          Text(DataService.to.userName.value)

          // FutureBuilder<Map<String, dynamic>?>(
          //     future: controller.getUser(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         return const Text('error');
          //       }
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Text('loading');
          //       }
          //       if (snapshot.data == null) {}

          //       return Text(snapshot.data!['name']);
          //     })
        ]),
      ),
    );
  }
}
