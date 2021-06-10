import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:offstage_common_bnv/screens/ui_login/login_page.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/controller/signup_controller.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/sign_up.dart';

import '../../main.dart';

class Routes {
  static void logout() => Get.offAll(() => MyApp());

  static void login() => Get.offAll(() => LoginPage());

  static void signup() => Get.to(() => SignupPage(),
      binding: BindingsBuilder.put(() => SignUpController()));

  static void main() => Get.offAll(() => MainScreen());
}
