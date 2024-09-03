import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/constants.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';

class AnimatedListTileWidget extends StatelessWidget {
  const AnimatedListTileWidget({
    super.key,
    required this.data,
    required this.index,
    this.onRemoval,
  });

  final int index;
  final VoidCallback? onRemoval;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 15.paddingAll,
      margin: 15.paddingBottom,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.amber,
                child: Text(
                  '$index',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              10.horizontalSpace,
              Text(
                '${data[kTitleKey]}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const Spacer(),
              IconButton(
                onPressed: onRemoval,
                icon: const Icon(Icons.remove),
              )
            ],
          ),
          10.horizontalSpace,
          Text(
            '${data[kDescKey]}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
