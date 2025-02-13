import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_experiments/widgets/hello_world_card.dart';

class BlackholeScreen extends StatefulWidget {
  const BlackholeScreen({super.key});

  @override
  State<BlackholeScreen> createState() => _BlackholeScreenState();
}

class _BlackholeScreenState extends State<BlackholeScreen>
    with TickerProviderStateMixin {
  final double cardSize = 150;

  late final holeSizeTween = Tween(begin: 0, end: 1.5 * cardSize);
  late final holeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final cardAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final cardOffsetTween = Tween(begin: 0, end: 2 * cardSize)
      .chain(CurveTween(curve: Curves.easeInBack));
  late final cardRotationTween =
      Tween(begin: 0, end: .5).chain(CurveTween(curve: Curves.easeInBack));
  late final cardElevationTween = Tween<double>(begin: 2, end: 20);

  double get cardOffset =>
      cardOffsetTween.evaluate(cardAnimationController).toDouble();
  double get cardRotation =>
      cardRotationTween.evaluate(cardAnimationController).toDouble();
  double get cardElevation =>
      cardElevationTween.evaluate(cardAnimationController).toDouble();

  double get holeSize =>
      holeSizeTween.evaluate(holeAnimationController).toDouble();

  @override
  void initState() {
    holeAnimationController.addListener(() => setState(() {}));
    cardAnimationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    holeAnimationController.dispose();
    cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Experiments"),
      ),
      body: Center(
        child: SizedBox(
          height: cardSize * 1.25,
          width: double.infinity,
          child: ClipPath(
            clipper: BlackHoleClipper(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: holeSize,
                  child: Image.asset(
                    "assets/images/hole.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, cardOffset),
                      child: Transform.rotate(
                        angle: cardRotation,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: HelloWorldCard(
                            size: cardSize,
                            elevation: cardElevation,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          IconButton.filled(
            onPressed: () {
              holeAnimationController.forward();
              cardAnimationController.forward().then((_) {
                Future.delayed(const Duration(milliseconds: 200), () {
                  holeAnimationController.reverse();
                });
              });
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton.filled(
            onPressed: () {
              holeAnimationController.reverse();
              cardAnimationController.reverse();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class BlackHoleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      0,
      math.pi,
      true,
    );
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
