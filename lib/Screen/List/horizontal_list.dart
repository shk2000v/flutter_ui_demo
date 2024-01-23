import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              color: Colors.yellow,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
            Container(
              width: 160,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
