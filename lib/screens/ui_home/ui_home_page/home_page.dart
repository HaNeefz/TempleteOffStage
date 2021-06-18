import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:offstage_common_bnv/app_controller/app_controller.dart';
import 'package:offstage_common_bnv/components/app_loading.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_in/controller/login_controller.dart';

import 'controller/controller_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController appController = AppController.to;

  final LoginController controller = LoginController.to;

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => appController.gotoSetting(context),
          )
        ],
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.employee!.value!.image != '')
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: MemoryImage(
                        base64Decode(controller.employee!.value!.image!)),
                  ),
                );
              else
                return SizedBox();
            }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${controller.employee!.value!.name!}"),
                  Text(
                    "Login date : ${controller.employee!.value!.loginDate!}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Obx(() {
              if (homeController.isloading.value) {
                return AppLoading();
              } else {
                return Expanded(
                  child: RefreshIndicator(
                      onRefresh: () async => await homeController.onRefresh(),
                      child: AnimatedList(
                          physics: ClampingScrollPhysics(),
                          key: homeController.listKey,
                          controller: homeController.scrollController.value,
                          initialItemCount: homeController.employees.length,
                          itemBuilder:
                              (BuildContext context, int index, animation) {
                            final data = homeController.employees[index];
                            return slideIt(animation, data!, index, context);
                          })),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget slideIt(Animation<double> animation, Employee data, int index,
      BuildContext context) {
    return Slidable(
      key: ValueKey(data.createDate),
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: LineIcons.userEdit,
          onTap: () => homeController.gotoEditEmployee(context, data),
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => homeController.onDeleteItem(
            index,
            data.id,
            (animation) => slideIt(animation, data, index, context),
          ),
        ),
      ],
      child: SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: MemoryImage(base64Decode(data.image!)),
          ),
          title: Text(data.name!),
          subtitle: Text(data.createDate!),
          selected: data.id == controller.employee!.value!.id,
          onTap: () => homeController.gotoDetailEmployee(context, data),
          trailing: data.id == homeController.loadingDeleteID.value
              ? SizedBox(
                  width: 25,
                  height: 25,
                  child: AppLoading(),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
