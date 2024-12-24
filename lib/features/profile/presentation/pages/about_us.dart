import 'package:lottie/lottie.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getSettings();
  }

  bool isEnglish(String text) {
    RegExp englishRegex = RegExp(r'^[a-zA-Z\s]+$');
    return englishRegex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "About us".tr(),
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingGetSettings
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : state.settings!.settings!.aboutUs == null
                  ? Center(
                      child: Column(
                        children: [
                          Lottie.asset('assets/images/empty_data.json'),
                          Text(
                            "There are no data here".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "${state.settings!.settings!.aboutUs}",
                              style: TextStyle(height: 2),
                              // textAlign:
                              //     isEnglish(state.settings!.settings!.aboutUs!)
                              //         ? TextAlign.left
                              //         : TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
