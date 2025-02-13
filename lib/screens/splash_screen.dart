import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_experiments/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_experiments/services/local_auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ValueNotifier<bool?> isAuthenticated = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    initTime();
    addListner();
  }

  Future<void> initTime() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      isAuthenticated.value = await LocalAuthService.shared.authenticate();
      log("isAuthenticated => ${isAuthenticated.value}");
    });
  }

  void addListner() {
    isAuthenticated.addListener(() {
      if (isAuthenticated.value == true) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeScreen,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: isAuthenticated,
            builder: (context, value, _) {
              if (value == false) return _buildUnAuthenticatedView();

              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lotties/experiments.json',
                      repeat: false,
                    ),
                    Text(
                      "FLUTTER",
                      style: GoogleFonts.dosis(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                        letterSpacing: 10,
                      ),
                    ),
                    Text(
                      "Experiments",
                      style: GoogleFonts.dosis(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        letterSpacing: 10,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _buildUnAuthenticatedView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Oops!",
            style: GoogleFonts.dosis(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              letterSpacing: 8,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Authentication is must for using the app. So, please make sure to authenticate your self.",
            textAlign: TextAlign.center,
            style: GoogleFonts.dosis(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              isAuthenticated.value =
                  await LocalAuthService.shared.authenticate();
            },
            child: const Text("Authenticate"),
          ),
        ],
      ),
    );
  }
}
