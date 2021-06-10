import 'package:flutter/material.dart';
import 'package:offstage_common_bnv/screens/ui_home/screen_2.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Center(
          child: TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen2())),
            child: Text('Go to next screen'),
          ),
        ),
      ),
    );
  }
}
