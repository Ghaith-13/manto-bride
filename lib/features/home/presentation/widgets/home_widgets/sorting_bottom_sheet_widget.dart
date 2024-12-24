import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';

Widget sortingSectionsBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        controller: scrollController,
        children: [
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              )
            ],
          ),
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sort by".tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 18.sp),
              ),
            ],
          ),
          10.ph,
          Row(
            children: [
              Text(
                "Popular".tr(),
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          10.ph,
          Row(children: [
            Text(
              "Newest".tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "By name".tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "By favorite".tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "Most purchased".tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
        ],
      ),
    ),
  );
}
