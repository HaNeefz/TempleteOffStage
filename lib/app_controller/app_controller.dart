import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/navigation/xcore.dart';
import 'package:offstage_common_bnv/screens/ui_login/controller/login_controller.dart';

class MainCtrl extends GetxController {
  static MainCtrl get to => Get.find();

  Rx<TabItem> _currentTab = TabItem.tab1.obs;
  Rx<TabItem> get currentTab => _currentTab;

  var _navigatorKeys = {
    TabItem.tab1: GlobalKey<NavigatorState>(),
    TabItem.tab2: GlobalKey<NavigatorState>(),
    TabItem.tab3: GlobalKey<NavigatorState>(),
    TabItem.tab4: GlobalKey<NavigatorState>(),
  }.obs;

  @override
  void onClose() {
    print('onClose MainCtrl');
    super.onClose();
  }

  RxMap<TabItem, GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

    print('isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());
    if (isFirstRouteInCurrentTab) {
      // if not on the 'main' tab
      if (_currentTab.value != TabItem.tab1) {
        // select 'main' tab
        selectTab(TabItem.tab1);
        // back button handled by app
        return false;
      }
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  void selectTab(TabItem tabItem) {
    if (tabItem == _currentTab.value) {
      // pop to first route
      // if (_navigatorKeys[tabItem]!.currentState!.canPop()) {
      //   _navigatorKeys[tabItem]!.currentState!.pop();
      // }
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      _currentTab(tabItem);
    }
  }

  void logout() {
    final LoginCtrl loginController = LoginCtrl.to;
    loginController.logout();
  }
}
