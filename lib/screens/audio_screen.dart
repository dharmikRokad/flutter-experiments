import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late final FlutterSoundPlayer? player;

  late final Stream<PlaybackDisposition>? progessStream;

  double audioProgress = 0;

  double playedTime = 00.00;

  double? totalAudioTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      player = await FlutterSoundPlayer().openPlayer();
      progessStream = player?.onProgress;

      progessStream?.listen(
        (disposition) {
          setState(() {
            audioProgress = disposition.position.inSeconds.toDouble();
          });
        },
      );
    });
  }

  @override
  void dispose() {
    player?.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio app')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await player?.startPlayer(
                fromURI:
                    "https://file-examples.com/storage/fe1917a9ed66c3802a1da80/2017/11/file_example_MP3_700KB.mp3",
                whenFinished: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog.adaptive(
                        title: Text('Congratulations!!🎉🎊'),
                        content: Text(
                          'The Audio is finished, you listend the whole audio, pride of your patience, man!',
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Text('Play'),
          ),
          ElevatedButton(
            onPressed: () async {
              await player?.pausePlayer();
            },
            child: const Text('Pause'),
          ),
        ],
      ),
    );
  }
}
