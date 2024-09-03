import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TODO: Add app icon here
          Image.asset('name'),
          10.verticalSpace,
          const Text('Flutter'),
          4.verticalSpace,
          const Text('Experiments'),
        ],
      ),
    );
  }
}
