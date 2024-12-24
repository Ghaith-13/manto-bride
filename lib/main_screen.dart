// ignore_for_file: deprecated_member_use

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:manto_bride/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/features/cart/presentation/pages/cart_screen.dart';
import 'package:manto_bride/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:manto_bride/features/home/presentation/pages/home.dart';
import 'package:manto_bride/features/profile/presentation/pages/profile_screen.dart';
import 'package:manto_bride/main.dart';
import 'package:manto_bride/services/local_notification_service.dart';

class mainScreen extends StatefulWidget {
  final int? navigateIndex;
  const mainScreen({super.key, this.navigateIndex});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

ScrollController scrollController = new ScrollController();

class _mainScreenState extends State<mainScreen> {
  final notificationService = LocalNotificationService();

  Future localNotificationService() async {
    await LocalNotificationService().initialize();

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
  }

  int myIndex = 0;

  List<Widget> screens = [
    HomeScreen(scrollController: scrollController),
    AllProductsScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    localNotificationService();
    if (widget.navigateIndex != null) {
      setState(() {
        myIndex = widget.navigateIndex!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screens[myIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.sp),
              color: Colors.white,
              // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                unselectedLabelStyle: TextStyle(fontSize: 7.sp),
                selectedItemColor: AppColors.primaryColor,
                selectedIconTheme:
                    IconThemeData(size: 30, color: AppColors.primaryColor),
                selectedLabelStyle: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedItemColor: Colors.black54,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  if (index == 0 && myIndex == 0) {
                    scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  }
                  setState(() {
                    myIndex = index;
                  });
                },
                currentIndex: myIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: 30.sp,
                      color: myIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      height: 30.sp,
                    ),
                    label: "Home".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/all_products.svg",
                      width: 30.sp,
                      height: 30.sp,
                      color: myIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                    ),
                    label: "All Products".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/basket.svg",
                      width: 30.sp,
                      height: 30.sp,
                      color: myIndex == 2
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                    ),
                    label: "Cart".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/favorite.svg",
                      width: 30.sp,
                      height: 30.sp,
                      color: myIndex == 3
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                    ),
                    label: "Favorite".tr(),
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/profile.svg",
                        width: 30.sp,
                        height: 30.sp,
                        color: myIndex == 4
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                      ),
                      label: "My Account".tr()),
                ],
              ),
            ),
          ),
        ));
  }
}
