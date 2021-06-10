import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum TabItem { tab1, tab2, tab3, tab4 }

Map<TabItem, String> tabName = {
  TabItem.tab1: 'tab1',
  TabItem.tab2: 'tab2',
  TabItem.tab3: 'tab3',
  TabItem.tab4: 'tab4',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.tab1: Colors.red,
  TabItem.tab2: Colors.green,
  TabItem.tab3: Colors.blue,
  TabItem.tab4: Colors.blue,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem? currentTab;
  final ValueChanged<TabItem>? onSelectTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _generateNavigation(context, 0, LineIcons.home, "Main"),
          _generateNavigation(context, 1, LineIcons.calendar, "Calenda"),
          _generateNavigation(context, 2, LineIcons.user, "Account"),
          _generateNavigation(context, 3, LineIcons.search, "Search"),
        ],
      ),
    );
  }

  Widget _generateNavigation(context, i, icon, text) {
    Color? colors =
        currentTab == TabItem.values[i] ? Colors.red[900] : Colors.grey;
    bool? _isCurrentTab = currentTab == TabItem.values[i];

    return Expanded(
      child: TextButton(
        onPressed: () async {
          // if (_mainViewModel.charging) return;
          if (TabItem.values[i] == TabItem.tab2) {
            onSelectTab!(
              TabItem.values[i],
            );
          } else {
            if (TabItem.values[i] == TabItem.tab3) {
              onSelectTab!(
                TabItem.values[i],
              );
            } else if (TabItem.values[i] == TabItem.tab4) {
              onSelectTab!(
                TabItem.values[i],
              );
            } else {
              onSelectTab!(
                TabItem.values[i],
              );
            }
          }
        },
        child: Container(
          width: double.infinity,
          color: _isCurrentTab ? Colors.grey[300] : Colors.transparent,
          child: Column(
            children: [
              SizedBox(height: 8),
              Icon(
                icon,
                color: colors,
              ),
              // AnimatedDefaultTextStyle(
              //   duration: const Duration(milliseconds: 300),
              //   style: TextStyle(
              //       color: colors,
              //       fontWeight:
              //           _isCurrentTab ? FontWeight.bold : FontWeight.normal,
              //       fontSize: _isCurrentTab ? 15 : 12),
              //   child: Text(
              //     text,
              //   ),
              // ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  color: colors,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
