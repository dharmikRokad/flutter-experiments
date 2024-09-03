// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_experiments/routes/app_routes.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'keys.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAuthentication localAuth = LocalAuthentication();

  bool didAuthenticate = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        didAuthenticate = await localAuth.authenticate(
          localizedReason:
              'Security is our main concern. make sure that you are the acctual user of the app.',
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ),
          authMessages: [
            const IOSAuthMessages(
              cancelButton: 'cancel',
              goToSettingsButton: 'Settings',
              goToSettingsDescription:
                  'If you not added any auth methods, go and add it from the settings by taping the button below.',
            ),
            const AndroidAuthMessages(
                biometricNotRecognized: 'Biometrics not recognized.',
                cancelButton: 'cancel',
                goToSettingsButton: 'Settings',
                goToSettingsDescription:
                    'If you not added any auth methods, go and add it from the settings by taping the button below.',
                biometricRequiredTitle: 'Biometrics requied.')
          ],
        );
        setState(() {});
        log('didAuthenticate => $didAuthenticate');
      } catch (e) {
        log('error while authentication: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routes: AppRouter.getRoutes(),
      // onGenerateRoute: AppRouter.generateRoutes,
      initialRoute: AppRoutes.homeScreen,
      themeMode: ThemeMode.system,
    );
  }
}
