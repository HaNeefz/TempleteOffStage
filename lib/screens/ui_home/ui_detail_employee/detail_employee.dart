import 'package:flutter/material.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';

import '../screen_3.dart';

class DetailEmployee extends StatelessWidget {
  final Employee data;

  const DetailEmployee({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                data.name ?? '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              margin: EdgeInsets.all(16),
            ),
            ElevatedButton(
              child: Text('Go to Screen 3'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Screen3()));
              },
            )
          ],
        ),
      ),
    );
  }
}
