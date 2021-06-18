import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/models/boolean_model.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';
import 'package:offstage_common_bnv/screens/ui_home/ui_detail_employee/detail_employee.dart';
import 'package:offstage_common_bnv/screens/ui_home/ui_edit_employee/edit_employee_page.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';
import 'package:offstage_common_bnv/services/repository.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var scrollController = ScrollController().obs;
  late var employees = <Employee?>[].obs;
  var isloading = false.obs;
  var loadingDeleteID = ''.obs;
  var listKey = GlobalKey<AnimatedListState>();

  @override
  void onInit() {
    super.onInit();
    scrollController.value.addListener(() {});
    getEmployee();
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

  onRefresh() async => await getEmployee();

  onDeleteItem(
    int index,
    String employeeID,
    Widget Function(Animation<double> animation) child,
  ) {
    Popup.actions(
      'Are you sure delete.',
      onConfirm: () {
        CallAPIs.call<RepoBoolean?>(
          APIs.deleteEmployee({'Id': employeeID}),
          onSuccess: (data) {
            loadingDeleteID(employeeID);
            Future.delayed(const Duration(milliseconds: 300), () {
              employees.removeAt(index);
              listKey.currentState!.removeItem(
                  index, (_, _animation) => child(_animation),
                  duration: const Duration(milliseconds: 300));
            });
          },
        );
      },
    );
  }

  getEmployee() async {
    isloading(true);
    final loginController = LoginController.to;
    await CallAPIs.call<RepoEmployees?>(
      APIs.getEmployees({"Id": loginController.employee!.value!.id}),
      showError: false,
      onSuccess: (data) {
        employees.clear();
        for (Employee item in data!.data!) {
          listKey.currentState?.insertItem(data.data!.indexOf(item),
              duration: const Duration(milliseconds: 500));
          employees.add(item);
        }
      },
    );

    isloading(false);
  }

  Employee? getMySelf(String id) {
    return employees.firstWhere((element) => element!.id == id,
        orElse: () => null);
  }

  gotoDetailEmployee(context, Employee emp) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailEmployee(data: emp)));
  }

  gotoEditEmployee(context, Employee emp) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditEmployeePage(emp)));
  }
}
