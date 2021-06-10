import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Popup {
  static Future<bool>? success() async {
    return await Get.dialog(
      AlertDialog(
        content: Text('Success'),
        actions: [_buttonConfirm()],
      ),
    );
  }

  static Future<bool>? error() async {
    return await Get.dialog(
      AlertDialog(
        content: Text('Failed'),
        actions: [_buttonCancel()],
      ),
    );
  }

  static Future<bool>? actions() async {
    return await Get.defaultDialog(
      radius: 5,
      middleText: 'Dialog Actions',
      actions: [
        _buttonCancel(),
        _buttonConfirm(),
      ],
    );
  }

  static TextButton _buttonCancel() {
    return TextButton(
      child: Text('CLOSE'),
      onPressed: () => Get.back(result: false),
    );
  }

  static TextButton _buttonConfirm() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(
        'OK',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => Get.back(result: true),
    );
  }
}
