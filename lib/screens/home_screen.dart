import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/constants.dart';
import 'package:flutter_experiments/routes/app_routes.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, dynamic>> pages = [
  {
    kRouteKey: AppRoutes.reorderableGridScreen,
    kTitleKey: 'Reorderable Grid',
    kColorKey: Colors.red,
  },
  {
    kRouteKey: AppRoutes.writeSomethingScreen,
    kTitleKey: 'Write Something',
    kColorKey: Colors.pink,
  },
  {
    kRouteKey: AppRoutes.blackholeScreen,
    kTitleKey: 'Blackhole',
    kDescKey: 'Get ready to go into the void.',
    kColorKey: Colors.purple,
  },
  {
    kRouteKey: AppRoutes.loginAnimationScreen,
    kTitleKey: 'Login',
    kDescKey: 'The login animation using rive.',
    kColorKey: Colors.teal,
  },
  {
    kRouteKey: AppRoutes.chatScreen,
    kTitleKey: 'Chat with Gemini',
    kColorKey: Colors.indigo,
  },
  {
    kRouteKey: AppRoutes.parallaxScrolkScreen,
    kTitleKey: 'Parallax scroll effect',
    kColorKey: Colors.blueGrey,
  },
  {
    kRouteKey: AppRoutes.animatedListScreen,
    kTitleKey: 'Animated List',
    kColorKey: Colors.teal,
  },
  {
    kRouteKey: AppRoutes.wondersScreen,
    kTitleKey: '7 Wonders',
    kDescKey: 'Expandable animated card using animated position.',
    kColorKey: Colors.cyan,
  },
  {
    kRouteKey: AppRoutes.dragDropScreen,
    kTitleKey: 'Drag drop',
    kDescKey: 'Simple demo for drag-drop feature.',
    kColorKey: Colors.amber,
  },
  {
    kRouteKey: AppRoutes.sensorsPlusScreen,
    kTitleKey: 'Sensors demo',
    kDescKey: 'demo project with sensors_plus_flutter',
    kColorKey: Colors.pinkAccent,
  },
  {
    kRouteKey: AppRoutes.audioScreen,
    kTitleKey: 'Audio app',
    kDescKey: 'demo project with flutter_sound',
    kColorKey: Colors.amberAccent,
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showColors = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            tooltip: showColors ? 'Remove colors' : 'Add colors',
            onPressed: () {
              setState(() => showColors = !showColors);
            },
            icon: Icon(
              showColors
                  ? Icons.brightness_5_rounded
                  : Icons.brightness_high_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1536152470836-b943b246224c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: 10.paddingVertical,
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: pages.map((e) => pageCard(e)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget pageCard(Map<String, dynamic> configs) => FadeInUp(
        child: Container(
          margin: (8, 10).paddingSymmetric,
          child: GlassContainer(
            blur: 3,
            opacity: .5,
            color: showColors ? (configs[kColorKey] as Color) : Colors.blueGrey,
            width: MediaQuery.of(context).size.width * .45,
            height: MediaQuery.of(context).size.width * .50,
            padding: 10.paddingAll,
            borderRadius: BorderRadius.circular(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  configs[kTitleKey],
                  style: GoogleFonts.dosis(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                  maxLines: 2,
                ),
                8.verticalSpace,
                Text(
                  configs[kDescKey] ?? '',
                  style: GoogleFonts.dosis(
                    fontSize: 15,
                    color: Colors.white,
                    // letterSpacing: 1.5,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      size: 50,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(configs[kRouteKey]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
