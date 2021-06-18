import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/components/app_loading.dart';
import 'package:offstage_common_bnv/components/default_button.dart';
import 'package:offstage_common_bnv/components/default_textfield.dart';
import 'package:offstage_common_bnv/navigation/routes/routes.dart';

import 'controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FlutterLogo(
                  size: 100,
                  style: FlutterLogoStyle.stacked,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: Text("Please enter your information.")),
                SizedBox(height: 20),
                Obx(() => DefaultTextField(
                      controller: controller.enterName.value,
                      currentFocus: controller.nodeName.value,
                      nextFocus: controller.nodePassword.value,
                      label: 'Name',
                    )),
                SizedBox(height: 10),
                Obx(() => DefaultTextField(
                      controller: controller.enterPassword.value,
                      currentFocus: controller.nodePassword.value,
                      secure: true,
                      label: 'Password',
                    )),
                SizedBox(height: 10),
                Obx(() {
                  if (controller.pressOnSave.value) {
                    return AppLoading();
                  } else {
                    return DefaultButton(
                      text: 'Sign in',
                      onPressed: () async => await controller.onSignin(),
                    );
                  }
                }),
                SizedBox(height: 10),
                Divider(
                  indent: 50,
                  endIndent: 50,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => Routes.signup(),
                    ),
                    Text(' | '),
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: Text('Forgot password ?'),
                      onPressed: () {},
                    ),
                  ],
                ),
                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(LineIcons.facebook),
                //     SizedBox(width: 10),
                //     Icon(LineIcons.googlePlus),
                //     SizedBox(width: 10),
                //     Icon(LineIcons.apple)
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
