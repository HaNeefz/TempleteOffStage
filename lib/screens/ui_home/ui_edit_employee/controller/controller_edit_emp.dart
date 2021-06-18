import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';
import 'package:offstage_common_bnv/navigation/routes/routes.dart';
import 'package:offstage_common_bnv/screens/ui_home/ui_home_page/controller/controller_home.dart';
import 'package:offstage_common_bnv/services/repository.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class EditEmployeeController extends GetxController {
  Employee? employee;
  var enterName = TextEditingController();
  var enterLastName = TextEditingController();
  var enterPhoneNumber = TextEditingController();
  var nodeName = FocusNode();
  var nodeLastName = FocusNode();
  var nodePhoneNumber = FocusNode();
  var isSend = false.obs;

  @override
  void onClose() {
    enterName.dispose();
    enterLastName.dispose();
    enterPhoneNumber.dispose();
    nodeName.dispose();
    nodeLastName.dispose();
    nodePhoneNumber.dispose();
    super.onClose();
  }

  initEmployee(Employee emp) {
    this.employee = emp;
    enterName.text = this.employee!.name!;
    enterLastName.text = this.employee!.lastName!;
    enterPhoneNumber.text = this.employee!.phoneNumber!;
  }

  onEdit(context) {
    String? error;
    if (enterName.text.isEmpty) {
      error = 'Plase enter name';
      FocusScope.of(Get.context!).requestFocus(nodeName);
    }
    if (enterLastName.text.isEmpty) {
      error = 'Plase enter last name';
      FocusScope.of(Get.context!).requestFocus(nodeLastName);
    }
    if (enterPhoneNumber.text.isEmpty) {
      error = 'Plase enter phone number';
      FocusScope.of(Get.context!).requestFocus(nodePhoneNumber);
    }

    if (error != null) {
      Popup.error(error);
    } else {
      isSend(true);
      CallAPIs.call(
          APIs.editEmployee({
            'Id': employee!.id,
            'Name': enterName.text,
            'LastName': enterLastName.text,
            'PhoneNumber': enterPhoneNumber.text,
          }), onSuccess: (data) {
        isSend(false);
        final HomeController controller = HomeController.to;
        int index = controller.employees.indexOf(employee);
        controller.employees[index]!.name = enterName.text;
        controller.employees[index]!.lastName = enterLastName.text;
        controller.employees[index]!.phoneNumber = enterPhoneNumber.text;
        Routes.popRoot(context);
      }, onError: (data) {
        isSend(false);
      });
    }
  }
}
