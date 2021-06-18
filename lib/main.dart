import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/navigation/bottom_navigation.dart';

import 'app_controller/app_controller.dart';
import 'navigation/tab_navigation.dart';
import 'screens/ui_login/ui_sign_in/controller/login_controller.dart';
import 'screens/ui_login/ui_sign_in/login_page.dart';
import 'services/service.dart';

void main() {
  // on branch dev
  // Test previous commit id
  Get.lazyPut(() => LoginController());
  Service.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await controller.onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Obx(() => BottomNavigation(
              currentTab: controller.currentTab.value,
              onSelectTab: controller.selectTab,
            )),
        body: Stack(
          children: [
            _buildOffstageNavigator(TabItem.tab1),
            _buildOffstageNavigator(TabItem.tab2),
            _buildOffstageNavigator(TabItem.tab3),
            _buildOffstageNavigator(TabItem.tab4),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Obx(() => Offstage(
        offstage: controller.currentTab.value != tabItem,
        child: TabNavigator(
          navigatorKey: controller.navigatorKeys[tabItem],
          tabItem: tabItem,
        )));
  }
}
