import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/login_page.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/controller/signup_controller.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/sign_up.dart';

import '../../main.dart';

class Routes {
  static Future<dynamic> push(context, Widget widget) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static Future<dynamic> pushReplace(context, Widget widget) async {
    return await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void pop(context, {dynamic result}) {
    Navigator.of(context, rootNavigator: true).pop(result);
  }

  static void popRoot(context, {dynamic result}) {
    Navigator.of(context, rootNavigator: false).pop(result);
  }

  static void logout() => Get.offAll(() => MyApp());

  static void login() => Get.offAll(() => LoginPage());

  static void signup([String? name]) => Get.to(
        () => SignupPage(),
        arguments: name,
        binding: BindingsBuilder.put(() => SignUpController()),
      );

  static void main() => Get.offAll(() => MainScreen());
}
