import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/components/app_loading.dart';
import 'package:offstage_common_bnv/components/default_button.dart';
import 'package:offstage_common_bnv/components/default_textfield.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';

import 'controller/controller_edit_emp.dart';

class EditEmployeePage extends StatelessWidget {
  final Employee employee;
  EditEmployeePage(this.employee, {Key? key}) : super(key: key);
  final controllerEmp = Get.put(EditEmployeeController());
  @override
  Widget build(BuildContext context) {
    controllerEmp.initEmployee(employee);
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Profile"),
            SizedBox(height: 15),
            DefaultTextField(
              controller: controllerEmp.enterName,
              currentFocus: controllerEmp.nodeName,
              nextFocus: controllerEmp.nodeLastName,
              label: 'Name',
            ),
            SizedBox(height: 10),
            DefaultTextField(
              controller: controllerEmp.enterLastName,
              currentFocus: controllerEmp.nodeLastName,
              nextFocus: controllerEmp.nodePhoneNumber,
              label: 'LastName',
            ),
            SizedBox(height: 10),
            DefaultTextField(
              controller: controllerEmp.enterPhoneNumber,
              currentFocus: controllerEmp.nodePhoneNumber,
              label: 'PhoneNumber',
            ),
            SizedBox(height: 20),
            Obx(() => !controllerEmp.isSend.value
                ? DefaultButton(
                    text: 'Edit',
                    onPressed: () => controllerEmp.onEdit(context),
                  )
                : AppLoading())
          ],
        ),
      ),
    );
  }
}
