import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/app_controller/app_controller.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';

import 'controller/controller_home.dart';
import 'screen_2.dart';

class HomePage extends GetView<LoginController> {
  final AppController mainController = AppController.to;
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => mainController.gotoSetting(context),
          )
        ],
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${controller.user!.value.name!}"),
            Text(
              "Login date : ${controller.user!.value.loginTime!}",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: SingleChildScrollView(
          controller: homeController.scrollController.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...List.generate(
                50,
                (index) => ListTile(
                  title: Text(index.toString()),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Screen2(
                                index: index.toString(),
                              ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
