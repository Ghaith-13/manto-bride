import 'package:animate_do/animate_do.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:manto_bride/features/auth/presentation/widgets/choose_land_widgets/cahnge_curency_for_splash.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shimmer/shimmer.dart';

class ChooseLandAndCurency extends StatefulWidget {
  const ChooseLandAndCurency({super.key});

  @override
  State<ChooseLandAndCurency> createState() => _ChooseLandAndCurencyState();
}

class _ChooseLandAndCurencyState extends State<ChooseLandAndCurency> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getCurrencies();
  }

  final List<String> items = [
    'ar',
    'en',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "", false),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingCurrencies
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 0.5.sw,
                              height: 20.h,
                            ),
                          )),
                      10.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 1.sw,
                              height: 50.h,
                            ),
                          )),
                      20.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 0.5.sw,
                              height: 20.h,
                            ),
                          )),
                      10.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 1.sw,
                              height: 50.h,
                            ),
                          )),
                      50.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 1.sw,
                              height: 50.h,
                            ),
                          )),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Lottie.asset(
                        'assets/images/welcome.json',
                      ),
                      50.ph,
                      FadeInLeft(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose the application language".tr(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor),
                          ),
                          10.ph,
                          BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(state.locale.languageCode),
                                  items: items
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) async {
                                    bool confirmed =
                                        await showConfirmationDialog(context);
                                    if (confirmed) {
                                      setState(() {
                                        selectedValue = value;
                                        context
                                            .read<LocaleCubit>()
                                            .changeLanguage(value!);
                                      });
                                      Restart.restartApp(
                                        notificationTitle: 'Restarting App',
                                        notificationBody: '',
                                      );
                                    }
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50.h,
                                    width: 1.sw,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Colors.white,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.blackColor,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: AppColors.primaryColor,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 1.sw,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white,
                                    ),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: WidgetStateProperty.all(6),
                                      thumbVisibility:
                                          WidgetStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                      30.ph,
                      state.curencyData == null
                          ? SizedBox()
                          : FadeInRight(
                              child: CahngeCurencyForSplash(
                              fromSplash: true,
                              curencyData: state.curencyData,
                            )),
                      50.ph,
                      AppConstant.customElvatedButton(context, "Next", () {
                        AppConstant.customNavigation(
                            context, SignUpScreen(), -1, 0);
                      }, style: TextStyle(color: Colors.white))
                    ],
                  ),
                );
        },
      ),
    );
  }
}

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Confirmation'.tr()),
      content: Text('Are you sure you want to change language ?'.tr()),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'.tr(), style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'.tr(), style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
