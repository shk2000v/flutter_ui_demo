import 'package:flutter/material.dart';
import 'package:ui_test/Screen/List/baisc_list.dart';
import 'package:ui_test/Screen/List/grid_view_list.dart';
import 'package:ui_test/Screen/List/horizontal_list.dart';
import 'package:ui_test/Screen/List/long_list.dart';

class ListGridScreen extends StatelessWidget {
  const ListGridScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              RouteButton(
                page: BasicList(),
                title: '기본 리스트',
              ),
              RouteButton(
                page: HorizontalList(),
                title: '수평 리스트',
              ),
              RouteButton(
                page: GridViewList(),
                title: '그리드뷰 리스트',
              ),
              RouteButton(
                page: LongList(),
                title: '롱 리스트',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  final Widget page;
  final String title;
  const RouteButton({
    super.key,
    required this.page,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
      },
      child: Text(title),
    );
  }
}
