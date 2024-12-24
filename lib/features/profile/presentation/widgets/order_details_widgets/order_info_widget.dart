import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/profile/data/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class OrderInfoWidget extends StatefulWidget {
  final Pending orderDetails;

  const OrderInfoWidget({super.key, required this.orderDetails});

  @override
  State<OrderInfoWidget> createState() => _OrderInfoWidgetState();
}

class _OrderInfoWidgetState extends State<OrderInfoWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, locale) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order information".tr(),
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            20.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // width: 115.w,
                  child: Text(
                    "Shipping Address".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.greyColor),
                  ),
                ),
                20.pw,
                Expanded(
                  child: Text(
                    " ${widget.orderDetails.addressTitle} , ${widget.orderDetails.countryName} ${widget.orderDetails.provinceName} ${widget.orderDetails.areaName} ${widget.orderDetails.subAreaName}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.blackColor),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // width: 115.w,
                  child: Text(
                    "Payment method".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.greyColor),
                  ),
                ),
                20.pw,
                Expanded(
                  child: Text(
                    "${widget.orderDetails.paymentMethod}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.blackColor),
                  ),
                ),
              ],
            ),
            10.ph,
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 115.w,
            //       child: Text(
            //         "Delivery method".tr(),
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp,
            //             color: AppColors.greyColor),
            //       ),
            //     ),
            //     20.pw,
            //     Expanded(
            //       child: Text(
            //         "FedEx, 3 days, 15 \$",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 12.sp,
            //             color: AppColors.blackColor),
            //       ),
            //     ),
            //   ],
            // ),
            // 10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Total Amount before discount".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.totalAmount.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Product Discount value".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.discountValue.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn} (${widget.orderDetails.discountPercentage.toString()} %)",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Total Amount After Discount".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.totalAmountAfterDiscount.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Delivery".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.deliveryFees.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Tax".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.total_tax.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Summary".tr()} :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor),
                ),
                Text(
                  "${formatCurrency.format(double.parse(widget.orderDetails.grandTotal.toString()))} ${locale.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            10.ph,
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 115.w,
            //       child: Text(
            //         "Discount".tr(),
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp,
            //             color: AppColors.greyColor),
            //       ),
            //     ),
            //     20.pw,
            //     Expanded(
            //       child: Text(
            //         "${formatCurrency.format(double.parse(widget.orderDetails.discountValue ?? ""))}   (${double.parse(widget.orderDetails.discountPercentage ?? "").toStringAsFixed(2)} %)",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 12.sp,
            //             color: AppColors.blackColor),
            //       ),
            //     ),
            //   ],
            // ),
            // 10.ph,
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 115.w,
            //       child: Text(
            //         "Total amount".tr(),
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 12.sp,
            //             color: AppColors.greyColor),
            //       ),
            //     ),
            //     20.pw,
            //     Expanded(
            //       child: BlocBuilder<LocaleCubit, LocaleState>(
            //         builder: (context, state) {
            //           return Text(
            //             "${formatCurrency.format(double.parse(widget.orderDetails.grandTotal ?? ""))} ${state.locale.languageCode == "ar" ? widget.orderDetails.currency!.symbolAr : widget.orderDetails.currency!.symbolEn}",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 12.sp,
            //                 color: AppColors.blackColor),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}
