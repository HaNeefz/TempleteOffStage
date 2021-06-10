import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/components/default_button.dart';
import 'package:offstage_common_bnv/components/default_textfield.dart';
import 'package:offstage_common_bnv/navigation/routes/routes.dart';
import 'package:offstage_common_bnv/screens/ui_login/controller/login_controller.dart';

class LoginPage extends GetView<LoginCtrl> {
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
                      label: 'Name',
                    )),
                SizedBox(height: 10),
                Obx(() => DefaultTextField(
                      controller: controller.enterPassword.value,
                      label: 'Password',
                    )),
                SizedBox(height: 10),
                Obx(() {
                  if (controller.pressOnSave.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return DefaultButton(
                      text: 'Sign in',
                      foregroundColor: Colors.white,
                      onPressed: () => controller.onSignin(),
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
