import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import 'tab_component.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem? tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {TabItem? tabItem}) {
    return {
      TabNavigatorRoutes.root: (context) => TabComponent(tabItem),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context, tabItem: tabItem);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
