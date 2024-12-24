import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/curencies_widget.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/language_widget.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/password_widget.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/personal_info.dart';
import 'package:shimmer/shimmer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        elvation: 0,
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.only(end: 15.w),
        //     child: Icon(
        //       Icons.search,
        //       size: 24.sp,
        //       color: AppColors.blackColor,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.laodingCurrencies
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
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
                                height: 40.h,
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
                                width: 0.5.sw,
                                height: 40.h,
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
                                height: 40.h,
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
                                height: 40.h,
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
                                height: 40.h,
                              ),
                            )),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings".tr(),
                          style: TextStyle(
                              fontSize: 34.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700),
                        ),
                        20.ph,
                        FadeInLeft(child: PersonalInfo()),
                        50.ph,
                        state.userInfo!.phone == null
                            ? SizedBox()
                            : state.userInfo!.phone.isEmpty
                                ? SizedBox()
                                : FadeInRight(child: PasswordWidget()),
                        // 50.ph,
                        // FadeInLeft(child: NotificationWidget()),
                        20.ph,
                        FadeInLeft(child: LanguageWidget()),
                        20.ph,
                        FadeInRight(
                            child: CurenciesWidget(
                          curencyData: state.curencyData,
                        ))
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
