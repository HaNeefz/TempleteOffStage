import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/main.dart';
import 'package:offstage_common_bnv/models/user_model.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/login_page.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  Rx<TextEditingController> enterName = TextEditingController().obs;
  Rx<TextEditingController> enterPassword = TextEditingController().obs;
  Rx<FocusNode> nodeName = FocusNode().obs;
  Rx<FocusNode> nodePassword = FocusNode().obs;
  Rx<User>? user;
  var pressOnSave = false.obs;

  @override
  void onClose() {
    print('onClose');
    enterName.close();
    enterPassword.close();
    nodeName.close();
    nodePassword.close();
    user = null;
    pressOnSave(false);
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  onSignin() {
    if (enterName.value.text.isEmpty || enterPassword.value.text.isEmpty) {
      Popup.error();
      if (enterName.value.text.isEmpty) {
        FocusScope.of(Get.context!).requestFocus(nodeName.value);
      } else {
        FocusScope.of(Get.context!).requestFocus(nodePassword.value);
      }
    } else {
      pressOnSave(true);
      Future.delayed(const Duration(seconds: 3), () {
        user = User(
          name: enterName.value.text,
          lastname: enterPassword.value.text,
          loginTime: DateTime.now().toString(),
        ).obs;
        pressOnSave(false);
        goToMainScreen();
      });
    }
  }

  onSigninByPass(String name, String password) {
    enterName.value.text = name;
    enterPassword.value.text = password;
    onSignin();
  }

  goToMainScreen() => Get.offAll(() => MainScreen());

  logout() {
    enterName.value.clear();
    enterPassword.value.clear();
    Get.offAll(() => LoginPage());
  }
}
