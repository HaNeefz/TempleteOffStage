import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Center(
          child: TextButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => DetailEmployee()));
            },
            child: Text('Go to next screen'),
          ),
        ),
      ),
    );
  }
}
