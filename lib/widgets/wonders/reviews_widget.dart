import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/wonders_data.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/hero_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final Location location;

  const ReviewsWidget({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: location.reviews.length,
        padding: 16.paddingVertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return buildReview(location.reviews[index], index);
        },
      );

  Widget buildReview(Review review, int index) => Padding(
        padding: 8.paddingVertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: 'review-${locations.indexOf(location)}-$index',
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black12,
                    backgroundImage: NetworkImage(review.urlImage),
                  ),
                ),
                Text(
                  review.username,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(),
                Text(
                  review.date,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              review.description,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
