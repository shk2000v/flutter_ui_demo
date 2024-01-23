import 'package:flutter/material.dart';

class GridViewList extends StatelessWidget {
  const GridViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: Text('index : $index'),
            );
          }),
        ),
      ),
    );
  }
}
