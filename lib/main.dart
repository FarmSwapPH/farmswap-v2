import 'package:farmswap_v2/src/features/authentication/presentation/bio_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/forgot_password_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/payment_method_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/set_location_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/splash_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/success_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/upload_photo_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/upload_profile_photo_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/verification_code_screen.dart';
import 'package:farmswap_v2/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: const SplashScreen(),
      ),
    );
  }
}
