import 'package:manto_bride/features/auth/presentation/pages/choose_land_and_curency.dart';
import 'package:manto_bride/main_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    requestNotificationPermissions();
    super.initState();
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            width: 1.sw,
            height: 0.5.sh,
          ),
        ],
      ),
      nextScreen: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            var token = snapshot.data?.getString('USER_TOKEN');
            if (token != null) {
              return const mainScreen();
            } else {
              return const ChooseLandAndCurency();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      backgroundColor: Colors.white,
      splashIconSize: 500,
      // duration: 500,
      // splashTransition: SplashTransition.sizeTransition,
      // animationDuration: const Duration(seconds: 1000),
    );
  }
}
