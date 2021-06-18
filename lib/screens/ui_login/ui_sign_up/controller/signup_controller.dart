import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/models/boolean_model.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';
import 'package:offstage_common_bnv/services/repository.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class SignUpController extends GetxController {
  var controllerName = TextEditingController().obs;
  var controllerLastName = TextEditingController().obs;
  var controllerPassword = TextEditingController().obs;
  var controllerPhoneNumber = TextEditingController().obs;
  var _isVerification = false.obs;
  var _isPressedVerify = false.obs;
  var _isCodeCorrect = false.obs;
  var _isLoading = false.obs;
  var _isAddImage = false.obs;
  var _isSendSignUp = false.obs;

  var _assumeCode = '1111';
  Uint8List? _image;

  Rx<bool> get verified => _isVerification;
  Rx<bool> get isAddImage => _isAddImage;
  Rx<bool> get isPressedVerify => _isPressedVerify;
  Rx<bool> get isCodeCorrect => _isCodeCorrect;
  Rx<bool> get isLoading => _isLoading;
  Rx<bool> get isSendSignUp => _isSendSignUp;
  Uint8List? get image => _image;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    controllerPhoneNumber.close();
    controllerName.close();
    controllerLastName.close();
    controllerPassword.close();
    super.onClose();
  }

  void setName(String? name) => controllerName.value.text = name ?? '';

  void setVerify() {
    if (controllerPhoneNumber.value.text.isEmpty) {
      Popup.error();
    } else {
      _isPressedVerify(true);
      Future.delayed(
        Duration(seconds: 1),
        () {
          _isVerification(true);
        },
      );
    }
  }

  void checkCode(String code) async {
    if (_assumeCode == code) {
      _isAddImage(true);
      // _isLoading(true);

      // _isLoading(false);
    } else {
      Popup.error();
    }
  }

  onPickerImage() async {
    /// check press add image again.
    if (_isLoading.value == true) {
      _isLoading(false);
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png'],
      type: FileType.custom,
    );

    if (result != null) {
      _isLoading(true);
      try {
        _image = result.files.first.bytes!;
      } catch (e) {
        print('e : $e');
      }
    } else {
      print('User canceled the picker');
      // User canceled the picker
    }
  }

  onSubmit() async {
    _isSendSignUp(true);
    var body = {
      "Name": controllerName.value.text,
      "LastName": controllerLastName.value.text,
      "Password": controllerPassword.value.text,
      "PhoneNumber": controllerPhoneNumber.value.text,
      "CreateDate": DateTime.now().toString(),
      "Image": base64Encode(_image!)
    };
    await CallAPIs.call<RepoBoolean?>(APIs.signUp(body),
        onSuccess: (data) {
          final LoginController loginController = LoginController.to;
          loginController.onSigninByPass(body['Name']!, body['Password']!);
        },
        onError: (data) => _isSendSignUp(false));
  }
}
