import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_test/Screen/List/list_grid.screen.dart';
import 'package:ui_test/Screen/Pattern/pattern_screen.dart';
import 'package:ui_test/Screen/State/state_manage_screen.dart';
import 'package:ui_test/Screen/physics_card_drag_demo.dart';
import 'package:ui_test/Screen/home_screen.dart';
import 'package:ui_test/Screen/page_animation_screen.dart';

void main() {
  // Provider 설정
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  // runAPp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        // '/pageAnimation': (context) => const _createRoute(),
        'physicAnimation': (context) => PhysicsCardDragDemo(),
        'list': (context) => ListGridScreen(),
        'stateManage': (context) => StateManageScreen(),
        'pattern': (context) => PatternScreen(),
      },
    );
  }
}
