import 'dart:async';

import 'package:flutter/material.dart';
import 'package:macrox_app/features/onboarding/presentation/pages/onboarding_page_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPageOne()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image(image: AssetImage('assets/images/macrox_logo.png')),
        ),
      ),
    );
  }
}
