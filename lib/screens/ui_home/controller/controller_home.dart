import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var scrollController = ScrollController().obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.value.addListener(() {});
  }

  void scrollOnTop() {
    if (scrollController.value.offset != 0.0) {
      scrollController.value.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

  @override
  void onClose() {
    scrollController.close();
    super.onClose();
  }
}
