import 'package:flutter/material.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Setting'),
            onPressed: () {
              final LoginController loginController = LoginController.to;
              loginController.logout();
            },
          ),
        ),
      ),
    );
  }
}
