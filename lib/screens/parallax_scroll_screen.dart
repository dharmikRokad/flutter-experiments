import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/parallax_data.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/parallax_tile.dart';

class ParallaxScollScreen extends StatefulWidget {
  const ParallaxScollScreen({super.key});

  @override
  State<ParallaxScollScreen> createState() => _ParallaxScollScreenState();
}

class _ParallaxScollScreenState extends State<ParallaxScollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Parallax scroll effect'),
      ),
      body: SingleChildScrollView(
        padding: (20, 10).paddingSymmetric,
        child: Column(
          children: parallaxImages.indexed
              .map(
                (e) => ParallaxTile(imageUrl: e.$2, name: 'Image ${e.$1}'),
              )
              .toList(),
        ),
      ),
    );
  }
}
