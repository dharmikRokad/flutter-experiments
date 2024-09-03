import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';

class DragDropScreen extends StatefulWidget {
  const DragDropScreen({super.key});

  @override
  State<DragDropScreen> createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen> {
  final int dragData = 102;

  final List<Color> containerColors = [
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.purple,
  ];

  List<Color> bottomPieces = [];

  final List<double> opacities = List.generate(4, (i) => .5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        bottomPieces = [...containerColors];
        bottomPieces.shuffle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drag game',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: GridView.builder(
            itemCount: containerColors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (_, i) {
              return _buildDragTarget(containerColors[i]);
            },
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomView(),
    );
  }

  Widget _buildBottomView() {
    return Container(
      height: 110,
      padding: 10.paddingAll,
      decoration: BoxDecoration(
        color: Colors.amber.shade200,
        border: const Border(
          top: BorderSide(color: Colors.amber),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Drag piece from here',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          15.verticalSpace,
          SizedBox(
            height: 50,
            child: ListView.separated(
              itemCount: bottomPieces.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => _buildDragPiece(bottomPieces[i]),
              separatorBuilder: (context, i) => 10.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDragPiece(Color color) {
    return Draggable<Color>(
      data: color,
      feedback: Container(
        height: 200,
        width: 200,
        color: color.withOpacity(.7),
      ),
      child: Container(
        height: 50,
        width: 50,
        color: color,
      ),
    );
  }

  Widget _buildDragTarget(Color value) {
    return DragTarget<Color>(
      builder: (context, accepted, rejected) {
        log('accepted => $accepted');
        log('rejected => $rejected');

        return Container(
          color: value.withOpacity(
            opacities[containerColors.indexOf(value)],
          ),
        );
      },
      onAcceptWithDetails: (DragTargetDetails<Color> details) {
        if (details.data == value) {
          log('correct piece');
          log('removing => $value - $value from list');
          bottomPieces.remove(value);
          setState(() {
            opacities[containerColors.indexOf(value)] = 1;
          });
        }

        if (opacities.every((opacity) => opacity == 1)) {
          _showCongratulationDialogue();
        }
      },
    );
  }

  Future<void> _showCongratulationDialogue() async {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text(
            'Congratulations!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'You have completed the puzzle. go back and come again to play new one.',
            style: TextStyle(fontSize: 17),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
