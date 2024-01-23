import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0; // 1.0 means normal animation speed.

    return Center(
      child: PhotoHero(
        photo: 'assets/images/puppy.jpg',
        width: 100.0,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              // fullscreenDialog: true,
              builder: (context) {
                return Scaffold(
                  // appBar: AppBar(
                  //   title: const Text('Flippers Page'),
                  // ),
                  body: SafeArea(
                    bottom: false,
                    child: Center(
                      child: Container(
                        // Set background to blue to emphasize that it's a new route.
                        color: Colors.lightBlueAccent,
                        // padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: PhotoHero(
                                photo: 'assets/images/puppy.jpg',
                                width: 300.0,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
