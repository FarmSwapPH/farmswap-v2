import 'package:farmswap_v2/src/features/authentication/presentation/onboarding_screen2.dart';
import 'package:flutter/material.dart';
import 'src/features/authentication/presentation/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmSwap v2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen1(),
    );
  }
}
