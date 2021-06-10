import 'package:flutter/material.dart';
import 'package:offstage_common_bnv/screens/ui_home/screen_2.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'SettingPage',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            margin: EdgeInsets.all(16),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: Text('Go to next screen'),
          ),
        ],
      ),
    );
  }
}
