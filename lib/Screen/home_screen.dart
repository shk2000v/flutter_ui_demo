import 'package:flutter/material.dart';
import 'package:ui_test/Screen/disc_data_screen.dart';
import 'package:ui_test/Screen/firework_screen.dart';
import 'package:ui_test/Screen/hero_animation_screen.dart';
import 'package:ui_test/Screen/page_animation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Test Home Screen '),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HeroAnimationScreen(),
                    ),
                  );
                },
                child: Text('move hero animation'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => PageAnimationScreen(),
                  //   ),
                  // );
                  // Navigator.of(context).pushNamed('/pageAnimation');
                  Navigator.of(context).push(_createRoute());
                },
                child: const Text('화면 이동 애니메이션'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('physicAnimation');
                },
                child: Text(
                  'PhysicsCardDragDemo',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('list');
                },
                child: Text(
                  'List 예시',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiscDataScreen(),
                  ));
                },
                child: Text(
                  'DiscData 애니메이션',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FireworkScreen(),
                  ));
                },
                child: Text(
                  '불꽃놀이',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('stateManage');
                },
                child: Text(
                  '상태관리',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const PageAnimationScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 2. Create Tween
      const begin = Offset(1.0, 0.0);
      // const begin = Offset(0.0, 0.1);
      // const begin = Offset.zero;
      const end = Offset.zero;
      // final tween = Tween(begin: begin, end: end);
      // final offsetAnimation = animation.drive(tween);

      // 4. use a CurveTween
      const curve = Curves.ease;
      final curveTween = CurveTween(curve: curve);

      // 5. combine the two Tweens
      // var tween = Tween(begin: begin, end: end).chain(curveTween);
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      // 3. use an AnimatedWidget
      return SlideTransition(
        // position: offsetAnimation,
        // position: animation.drive(tween),
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
