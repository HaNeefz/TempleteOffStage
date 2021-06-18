import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/main.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';
import 'package:offstage_common_bnv/navigation/routes/routes.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/login_page.dart';
import 'package:offstage_common_bnv/services/repository.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  Rx<TextEditingController> enterName = TextEditingController().obs;
  Rx<TextEditingController> enterPassword = TextEditingController().obs;
  Rx<FocusNode> nodeName = FocusNode().obs;
  Rx<FocusNode> nodePassword = FocusNode().obs;
  Rx<bool> pressOnSave = false.obs;

  int _loginWrong = 0;

  Rx<Employee?>? employee = Employee().obs;

  @override
  void onClose() {
    print('onClose');
    enterName.close();
    enterPassword.close();
    nodeName.close();
    nodePassword.close();
    pressOnSave(false);
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  onSignin() async {
    if (enterName.value.text.isEmpty || enterPassword.value.text.isEmpty) {
      Popup.error();
      if (enterName.value.text.isEmpty) {
        FocusScope.of(Get.context!).requestFocus(nodeName.value);
      } else {
        FocusScope.of(Get.context!).requestFocus(nodePassword.value);
      }
    } else {
      pressOnSave(true);
      var body = {
        "Name": enterName.value.text,
        "Password": enterPassword.value.text,
      };
      await CallAPIs.call<RepoEmployee?>(APIs.signIn(body), onSuccess: (data) {
        employee!.value = data!.data!;
        employee!.value!.loginDate = DateTime.now().toString();
        goToMainScreen();
      }, onError: (data) {
        _loginWrong++;
        if (_loginWrong == 3) {
          _loginWrong = 0;
          gotoSignUp();
        } else {
          Get.snackbar(
              'Login wrong!', 'You can log in ${3 - _loginWrong} more times.',
              snackPosition: SnackPosition.BOTTOM);
        }
      });

      pressOnSave(false);
    }
  }

  onSigninByPass(String name, String password) {
    enterName.value.text = name;
    enterPassword.value.text = password;
    onSignin();
  }

  gotoSignUp() => Routes.signup(enterName.value.text);

  goToMainScreen() => Get.offAll(() => MainScreen());

  logout() {
    enterName.value.clear();
    enterPassword.value.clear();
    Get.offAll(() => LoginPage());
  }
}
