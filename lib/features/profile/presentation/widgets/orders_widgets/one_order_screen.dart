import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/profile/data/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/profile/presentation/pages/order_details_screen.dart';
import 'package:intl/intl.dart';

class OneOrderScreen extends StatefulWidget {
  final String status;
  final Pending orderDetails;

  final Color color;
  const OneOrderScreen(
      {super.key,
      required this.status,
      required this.color,
      required this.orderDetails});

  @override
  State<OneOrderScreen> createState() => _OneOrderScreenState();
}

class _OneOrderScreenState extends State<OneOrderScreen> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(15.sp),
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Order".tr()} ${widget.orderDetails.number}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(widget.orderDetails.createdAt!))}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                )
              ],
            ),
            10.ph,
            // Row(
            //   children: [
            //     Text(
            //       "${"Tracking number".tr()} :",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 12.sp,
            //           color: AppColors.greyColor),
            //     ),
            //     5.pw,
            //     Text(
            //       "IW3475453455",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 12.sp,
            //           color: AppColors.blackColor),
            //     )
            //   ],
            // ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${"Quantity".tr()} :",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.greyColor),
                    ),
                    5.pw,
                    Text(
                      "${widget.orderDetails.items!.length}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: AppColors.blackColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${"Total Amount".tr()} :",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.greyColor),
                    ),
                    5.pw,
                    BlocBuilder<LocaleCubit, LocaleState>(
                      builder: (context, loclae) {
                        return Text(
                          "${(formatCurrency.format(double.parse(widget.orderDetails.grandTotal!)))} ${loclae.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: AppColors.blackColor),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    AppConstant.customNavigation(
                        context,
                        OrderDetailsScreen(
                          orderDetails: widget.orderDetails,
                          color: widget.color,
                          status: widget.status,
                        ),
                        -1,
                        0);
                  },
                  child: Container(
                      width: 98.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.sp),
                        border: Border.all(
                          color: Colors.black,
                          width: 2, // Adjust border width as needed
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Details".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                      )),
                ),
                Text(
                  widget.status.tr(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: widget.color),
                )
              ],
            )
          ],
        ));
  }
}
