import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/animated_list_data.dart';
import 'package:flutter_experiments/utils/data/constants.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/animated_list__tile_widget.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late final List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    items = animatedListData;
  }

  void addItem() {
    items.insert(0, {
      kTitleKey:
          'Item ${String.fromCharCode(Random().nextInt(25) + 65)}',
      kDescKey:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.'
    });
    setState(() {});
    _listKey.currentState!.insertItem(
      0,
      duration: 300.milliseconds,
    );
  }

  void removeItem(int index, Map<String, dynamic> data) {
    _listKey.currentState!.removeItem(index, (_, animation) {
      return ScaleTransition(
        scale: animation,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: BorderSide.strokeAlignInside,
          child: AnimatedListTileWidget(
            data: data,
            index: index,
          ),
        ),
      );
    });
    items.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animated List'),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Nothing to show. Please try to add an item\nusing \' + \' button above.',
                style: TextStyle(fontSize: 16, height: 1.2),
                textAlign: TextAlign.center,
              ),
            )
          : AnimatedList(
              key: _listKey,
              initialItemCount: animatedListData.length,
              padding: 15.paddingAll,
              itemBuilder: (context, index, animation) => ScaleTransition(
                scale: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: BorderSide.strokeAlignInside,
                  child: AnimatedListTileWidget(
                    data: animatedListData[index],
                    index: index,
                    onRemoval: () {
                      removeItem(index, animatedListData[index]);
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
