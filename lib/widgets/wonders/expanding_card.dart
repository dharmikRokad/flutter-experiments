import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/constants.dart';
import 'package:flutter_experiments/utils/data/wonders_data.dart';
import 'package:flutter_experiments/screens/wondors/location_details_screen.dart';
import 'package:flutter_experiments/utils/extensions/context_extension.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/hero_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ExpandingCard extends StatefulWidget {
  final Location location;

  const ExpandingCard({
    super.key,
    required this.location,
  });

  @override
  State<ExpandingCard> createState() => _ExpandingCardState();
}

class _ExpandingCardState extends State<ExpandingCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.paddingHorizontal,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: 500.milliseconds,
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? context.width * 0.85 : context.width * 0.7,
            height: isExpanded ? context.height * 0.5 : context.height * 0.4,
            child: buildBackgroundCard(),
          ),
          AnimatedPositioned(
            duration: 500.milliseconds,
            bottom: isExpanded ? 160 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              child: buildImageCard(context.mSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundCard() => AnimatedContainer(
        duration: 500.milliseconds,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        alignment: Alignment.bottomCenter,
        padding: 10.paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildTitlerow(),
            SizedBox(
              height: 45,
              child: ListView.separated(
                padding: 10.paddingVertical,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.location.reviews.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 5.horizontalSpace,
                itemBuilder: (context, index) => HeroWidget(
                  tag: 'review-${locations.indexOf(widget.location)}-$index',
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage:
                        NetworkImage(widget.location.reviews[index].urlImage),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildTitlerow() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.location.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.location.country,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          IconButton.filled(
            onPressed: () {
              // go to detail page
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: 500.milliseconds,
                  reverseTransitionDuration: 500.milliseconds,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0, 0.5),
                      ),
                      child: LocationDetailsScreen(
                        location: widget.location,
                        animation: animation,
                      ),
                    );
                  },
                ),
              );
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade300,
            ),
            icon: const Icon(
              Icons.keyboard_arrow_up,
            ),
          )
        ],
      );

  Widget buildImageCard(Size size) => HeroWidget(
        tag: widget.location.urlImage,
        child: AnimatedContainer(
          duration: 300.milliseconds,
          height: size.height * .5,
          width: size.width * .8,
          padding: (16, 10).paddingSymmetric,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.shade200,
            image: DecorationImage(
              image: NetworkImage(widget.location.urlImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
