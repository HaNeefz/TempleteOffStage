import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class SignUpController extends GetxController {
  var controllerPhoneNumber = TextEditingController().obs;
  var _isVerification = false.obs;
  var _isPressedVerify = false.obs;
  var _isCodeCorrect = false.obs;
  var _isLoading = false.obs;

  var _assumeCode = '1111';

  Rx<bool> get verified => _isVerification;
  Rx<bool> get isPressedVerify => _isPressedVerify;
  Rx<bool> get isCodeCorrect => _isCodeCorrect;
  Rx<bool> get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    controllerPhoneNumber.close();
    super.onClose();
  }

  void setVerify() {
    if (controllerPhoneNumber.value.text.isEmpty) {
      Popup.error();
    } else {
      _isPressedVerify(true);
      Future.delayed(
        Duration(seconds: 3),
        () {
          _isVerification(true);
        },
      );
    }
  }

  void checkCode(String code) {
    if (_assumeCode == code) {
      _isLoading(true);
      final LoginController loginController = LoginController.to;
      loginController.onSigninByPass('Haneef', '1234');
    } else {
      Popup.error();
    }
  }
}
