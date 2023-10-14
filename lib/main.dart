import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:farmswap_v2/src/providers/chosen/chosen_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

import 'src/features/authentication/presentation/splash_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PaymentChosenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'FarmSwap v2',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: FarmSwapGreen.normalGreen),
            useMaterial3: true,
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const DashboardScreen();
              } else {
                return const SplashScreen();
              }
            },
          ),
        );
      },
    );
  }
}
