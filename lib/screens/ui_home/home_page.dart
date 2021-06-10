import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:offstage_common_bnv/app_controller/app_controller.dart';
import 'package:offstage_common_bnv/screens/ui_login/controller/login_controller.dart';

import './screen_2.dart';

class HomePage extends GetView<LoginCtrl> {
  final MainCtrl mainController = MainCtrl.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(LineIcons.lock),
            onPressed: () => mainController.logout(),
          )
        ],
        title: Column(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                margin: EdgeInsets.all(16),
              ),
            ),
            Center(),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Text('Go to next screen'),
            ),
          ],
        ),
      ),
    );
  }
}
