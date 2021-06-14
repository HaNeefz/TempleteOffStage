import 'package:flutter/material.dart';

import 'screen_3.dart';

class Screen2 extends StatelessWidget {
  final String? index;

  const Screen2({Key? key, this.index}) : super(key: key);
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
                '${index ?? ''}',
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
