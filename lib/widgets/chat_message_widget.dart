import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
  });

  final Image? image;
  final String? text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isFromUser ? Colors.blueGrey.shade50 : Colors.amber.shade50,
      ),
      padding: 20.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameView(),
          _buildMessageView(),
        ],
      ),
    );
  }

  _buildNameView() => Row(
        children: [
          CircleAvatar(
            backgroundColor:
                isFromUser ? Colors.blueGrey.shade300 : Colors.amber,
            child: Text(isFromUser ? 'U' : 'G'),
          ),
          10.horizontalSpace,
          Text(
            isFromUser ? 'You' : 'Gemini',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      );

  _buildMessageView() => Row(
        children: [
          50.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (text case final text?)
                  MarkdownBody(
                    data: text,
                  ),
                if (image case final image?) image,
              ],
            ),
          ),
        ],
      );
}
