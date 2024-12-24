import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/features/auth/presentation/pages/sign_up_screen.dart';

class AppConstant {
  static CustomAlert(
      BuildContext context, String msg, bool withTranslate, bool error) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: error ? Colors.red : Colors.green,
        padding:
            EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
        content: Text(
          withTranslate ? msg.tr() : msg,
          style: TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static customNavigation(
      BuildContext context, Widget screen, double x, double y) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ),
    );
  }

  static customAppBar(BuildContext context, String title, bool canBack,
      {Color? backgroundColor,
      Color? IconColor,
      double? elvation,
      bool withTranslate = true,
      bool fromSignIn = false,
      List<Widget>? actions}) {
    return AppBar(
      actions: actions,
      elevation: elvation,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      leading: canBack
          ? InkWell(
              onTap: () {
                if (fromSignIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignUpScreen(),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: IconColor,
              ))
          : null,
      title: Text(
        withTranslate ? title.tr() : title,
        style: TextStyle(
            fontFamily: "Source Sans 3",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  static productDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: AppColors.thirdColor,
            ),
            10.pw,
          ],
        ),
      ),
      centerTitle: false,
      title: Icon(Icons.share_outlined, color: AppColors.thirdColor),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: AppColors.thirdColor),
          ),
        ),
      ],
    );
  }

  static customElvatedButton(
      BuildContext context, String title, Function onpress,
      {TextStyle? style, bool loading = false}) {
    return SizedBox(
        height: 48.h,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(75.r),
          child: ElevatedButton(
              onPressed: () {
                onpress();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.buttonColors,
                ),
              ),
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title.tr(),
                      style: style ??
                          TextStyle(
                              color: AppColors.secondryColor, fontSize: 14.sp),
                    )),
        ));
  }
}
