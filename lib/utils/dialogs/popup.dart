import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Popup {
  static Future<bool> success() async {
    return await Get.dialog(
      AlertDialog(
        content: Text('Success'),
        actions: [_buttonConfirm()],
      ),
    );
  }

  static Future<bool> error([String? message]) async {
    return await Get.dialog(
      AlertDialog(
        content: Text(message ?? 'Failed'),
        actions: [_buttonCancel()],
      ),
    );
  }

  static Future<bool> actions(
    String content, {
    Function? onConfirm,
    Function? onCancel,
  }) async {
    return await Get.defaultDialog(
      radius: 5,
      middleText: content,
      actions: [
        _buttonCancel(onCancel),
        _buttonConfirm(onConfirm),
      ],
    );
  }

  static TextButton _buttonCancel([Function? onCancel]) {
    return TextButton(
      child: Text('CLOSE'),
      onPressed: () {
        Get.back(result: false);
        onCancel?.call();
      },
    );
  }

  static TextButton _buttonConfirm([Function? onConfirm]) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(
        'OK',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Get.back(result: true);
        onConfirm?.call();
      },
    );
  }
}
