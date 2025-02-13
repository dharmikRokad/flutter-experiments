import 'package:flutter/material.dart';
import 'package:flutter_experiments/screens/animated_list_screen.dart';
import 'package:flutter_experiments/screens/audio_screen.dart';
import 'package:flutter_experiments/screens/blackhole_screen.dart';
import 'package:flutter_experiments/screens/chat_screen.dart';
import 'package:flutter_experiments/screens/drag_drop.dart';
import 'package:flutter_experiments/screens/login_animation_screen.dart';
import 'package:flutter_experiments/screens/sensors_plus_screen.dart';
import 'package:flutter_experiments/screens/splash_screen.dart';
import 'package:flutter_experiments/screens/wondors/location_details_screen.dart';
import 'package:flutter_experiments/screens/wondors/wonders_screen.dart';
import 'package:flutter_experiments/screens/home_screen.dart';
import 'package:flutter_experiments/screens/reordleable_grid_screen.dart';
import 'package:flutter_experiments/screens/parallax_scroll_screen.dart';
import 'package:flutter_experiments/screens/write_something_screen.dart';

class AppRouter {
  static getRoutes() => <String, Widget Function(BuildContext)>{
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.reorderableGridScreen: (context) =>
            const ReorderableGridScreen(),
        AppRoutes.writeSomethingScreen: (context) =>
            const WriteSomethingScreen(),
        AppRoutes.chatScreen: (context) => const ChatScreen(),
        AppRoutes.parallaxScrolkScreen: (context) =>
            const ParallaxScollScreen(),
        AppRoutes.animatedListScreen: (context) => const AnimatedListScreen(),
        AppRoutes.wondersScreen: (context) => const WondersScreen(),
        AppRoutes.dragDropScreen: (context) => const DragDropScreen(),
        AppRoutes.sensorsPlusScreen: (context) => const SensorsPlusScreen(),
        AppRoutes.audioScreen: (context) => const AudioScreen(),
        AppRoutes.loginAnimationScreen: (context) =>
            const LoginAnimationScreen(),
        AppRoutes.blackholeScreen: (context) => const BlackholeScreen(),
      };

  /// To generate custom page builers for named routes
  static Route<dynamic>? generateRoutes(RouteSettings settings) =>
      switch (settings.name) {
        AppRoutes.splashScreen => _customFadeTransition(
            child: const SplashScreen(),
            settings: settings,
          ),
        AppRoutes.reorderableGridScreen => _customFadeTransition(
            child: const ReorderableGridScreen(),
            settings: settings,
          ),
        AppRoutes.blackholeScreen => _customFadeTransition(
            child: const BlackholeScreen(),
            settings: settings,
          ),
        AppRoutes.writeSomethingScreen => _customFadeTransition(
            child: const WriteSomethingScreen(),
            settings: settings,
          ),
        AppRoutes.chatScreen => _customFadeTransition(
            child: const ChatScreen(),
            settings: settings,
          ),
        AppRoutes.parallaxScrolkScreen => _customFadeTransition(
            child: const ParallaxScollScreen(),
            settings: settings,
          ),
        AppRoutes.animatedListScreen => _customFadeTransition(
            child: const AnimatedListScreen(),
            settings: settings,
          ),
        AppRoutes.wondersScreen => _customFadeTransition(
            child: const WondersScreen(),
            settings: settings,
          ),
        AppRoutes.locationDetailsScreen => _customFadeTransition(
            child: LocationDetailsScreen(
              location: (settings.arguments as List)[0],
              animation: (settings.arguments as List)[1],
            ),
            settings: settings,
          ),
        AppRoutes.dragDropScreen => _customFadeTransition(
            child: const DragDropScreen(),
            settings: settings,
          ),
        AppRoutes.sensorsPlusScreen => _customFadeTransition(
            child: const SensorsPlusScreen(),
            settings: settings,
          ),
        AppRoutes.audioScreen => _customFadeTransition(
            child: const AudioScreen(),
            settings: settings,
          ),
        AppRoutes.loginAnimationScreen => _customFadeTransition(
            child: const LoginAnimationScreen(),
            settings: settings,
          ),
        AppRoutes.homeScreen ||
        null ||
        String() =>
          MaterialPageRoute(builder: (context) => const HomeScreen()),
      };

  /*static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.reorderableGridScreen:
        return _customFadeTransition(const ReorderableGridScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }*/

  static _customFadeTransition(
      {required Widget child, required RouteSettings settings}) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
          child: child,
        );
      },
    );
  }
}

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/';
  static const String reorderableGridScreen = '/reorderable_grid_screen';
  static const String writeSomethingScreen = '/write_something';
  static const String chatScreen = '/chatScreen';
  static const String parallaxScrolkScreen = '/parallax_scroll_screen';
  static const String animatedListScreen = '/animated_list_screen';
  static const String wondersScreen = '/wonders_screen';
  static const String locationDetailsScreen = '/location_datils_screen';
  static const String dragDropScreen = '/drag_drop_screen';
  static const String sensorsPlusScreen = '/sensors_plus_screen';
  static const String audioScreen = '/audio_screen';
  static const String loginAnimationScreen = '/login_animation_screen';
  static const String blackholeScreen = '/blackhole_screen';
}
