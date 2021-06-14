import 'package:flutter/material.dart';
import 'package:offstage_common_bnv/screens/ui_calenda/calendar_page.dart';
import 'package:offstage_common_bnv/screens/ui_home/home_page.dart';
import 'package:offstage_common_bnv/screens/ui_notification/notification_page.dart';
import 'package:offstage_common_bnv/screens/ui_search/search_page.dart';

import 'bottom_navigation.dart';

class TabComponent extends StatelessWidget {
  final TabItem? tabItem;

  TabComponent(this.tabItem);

  @override
  Widget build(BuildContext context) {
    // return Template(child: _buildTab());
    return _buildTab();
  }

  Widget _buildTab() {
    Widget widget;
    if (tabName[tabItem] == "tab1") {
      widget = HomePage();
    } else if (tabName[tabItem] == "tab2") {
      widget = CalendarPage();
    } else if (tabName[tabItem] == "tab3") {
      widget = SearchPage();
    } else {
      widget = NotificationPage();
    }
    return widget;
  }
}
