import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/wonders_data.dart';
import 'package:flutter_experiments/utils/extensions/context_extension.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/hero_widget.dart';
import 'package:flutter_experiments/widgets/wonders/reviews_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({
    super.key,
    required this.location,
    required this.animation,
  });

  final Location location;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('WONDERS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          10.horizontalSpace
        ],
        leading: const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * .35,
            child: SizedBox.expand(
              child: HeroWidget(
                tag: location.urlImage,
                child: Image.network(location.urlImage, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
              ),
              child: SingleChildScrollView(
                padding: 15.paddingAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleRow(),
                    30.verticalSpace,
                    Text(
                      location.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    10.verticalSpace,
                    const Divider(),
                    ReviewsWidget(location: location),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTitleRow() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location.country,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          RatingBar(
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 20,
            initialRating: location.starRating,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star),
              half: const Icon(Icons.star_half),
              empty: const Icon(Icons.star_border),
            ),
            onRatingUpdate: (double value) {},
          ),
        ],
      );
}
