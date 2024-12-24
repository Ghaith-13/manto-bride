// ignore_for_file: must_be_immutable

import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/extensions/colors_extensions.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/cart/data/models/get_cart_model.dart';
import 'package:manto_bride/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:manto_bride/features/home/presentation/pages/product_details_screen.dart';

class OneCartItemWidget extends StatefulWidget {
  Carts cartItem;
  OneCartItemWidget({super.key, required this.cartItem});

  @override
  State<OneCartItemWidget> createState() => _OneCartItemWidgetState();
}

class _OneCartItemWidgetState extends State<OneCartItemWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstant.customNavigation(
            context,
            ProductDetailsScreen(
                productId: widget.cartItem.product!.id.toString()),
            -1,
            0);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.sp),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0.sp),
                    bottomLeft: Radius.circular(8.0.sp)),
                child: CachedNetworkImage(
                  width: 104.sp,
                  height: 104.sp,
                  fit: BoxFit.fill,
                  imageUrl: widget.cartItem.product!.imageUrl ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<LocaleCubit, LocaleState>(
                          builder: (context, locale) {
                            return Text(
                              "${locale.locale.languageCode == "en" ? widget.cartItem.product!.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.cartItem.product!.nameAr ?? "" : widget.cartItem.product!.nameKu ?? ""}",
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: PopupMenuButton(
                            // offset: Offset.zero,
                            padding: EdgeInsets.all(0),
                            color: Colors.white,
                            icon: SvgPicture.asset("assets/icons/option.svg"),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'Add',
                                child: Text(widget.cartItem.product!.isFavorite!
                                    ? 'Remove from favorites'.tr()
                                    : 'Add to favorites'.tr()),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete from the list'.tr()),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'delete') {
                                context.read<CartCubit>().removeFromCart(
                                    context,
                                    "-${widget.cartItem.quantity}",
                                    widget.cartItem.id.toString(),
                                    FinalPrice:
                                        widget.cartItem.product!.finalPrice!,
                                    deleteAll: true);
                              } else {
                                context.read<HomeCubit>().toggleFavorite(
                                    widget.cartItem.product!.id.toString());
                                setState(() {
                                  widget.cartItem.product!.isFavorite =
                                      !widget.cartItem.product!.isFavorite!;
                                });
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    10.ph,
                    Row(
                      children: [
                        Text(
                          "${"Color".tr()} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: AppColors.greyColor),
                        ),
                        widget.cartItem.hexColor == "Other"
                            ? Text(
                                "Other".tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: AppColors.blackColor),
                              )
                            : Container(
                                width: 20.sp,
                                height: 20.sp,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor.fromHex(
                                      widget.cartItem.hexColor!),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                        20.pw,
                        Text(
                          "${"Size".tr()} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: AppColors.greyColor),
                        ),
                        widget.cartItem.size == "Other"
                            ? Text(
                                "Other".tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: AppColors.blackColor),
                              )
                            : Text(
                                "${widget.cartItem.size}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: AppColors.blackColor),
                              ),
                      ],
                    ),
                    10.ph,
                    // Row(
                    //   children: [
                    //     Text(
                    //       "${"weight".tr()} : ",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 11.sp,
                    //           color: AppColors.greyColor),
                    //     ),
                    //     widget.cartItem.weight == "Other"
                    //         ? Text(
                    //             "Other".tr(),
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 11.sp,
                    //                 color: AppColors.blackColor),
                    //           )
                    //         : Text(
                    //             "${widget.cartItem.weight}",
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 11.sp,
                    //                 color: AppColors.blackColor),
                    //           ),
                    //     20.pw,
                    //     Text(
                    //       "${"dimension".tr()} : ",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 11.sp,
                    //           color: AppColors.greyColor),
                    //     ),
                    //     widget.cartItem.dimension == "Other"
                    //         ? Text(
                    //             "Other".tr(),
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 11.sp,
                    //                 color: AppColors.blackColor),
                    //           )
                    //         : Text(
                    //             "${widget.cartItem.dimension}",
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 11.sp,
                    //                 color: AppColors.blackColor),
                    //           ),
                    //   ],
                    // ),
                    10.ph,
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<CartCubit>()
                                          .cahngeclcikedCartId(
                                              widget.cartItem.id);
                                      if (state.laodingUpdateItem &&
                                          state.clcikedCartId ==
                                              widget.cartItem.id) {
                                      } else {
                                        if (widget.cartItem.quantity == "1") {
                                        } else {
                                          setState(() {
                                            widget.cartItem.quantity =
                                                (int.parse(widget.cartItem
                                                            .quantity!) -
                                                        1)
                                                    .toString();
                                          });
                                          context
                                              .read<CartCubit>()
                                              .removeFromCart(
                                                  context,
                                                  "-1",
                                                  widget.cartItem.id
                                                      .toString());
                                          context
                                              .read<CartCubit>()
                                              .removefromTotalPrice(
                                                  double.parse(widget.cartItem
                                                      .product!.finalPrice!));
                                          // print("Done");
                                        }
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: state.laodingUpdateItem &&
                                              state.clcikedCartId ==
                                                  widget.cartItem.id
                                          ? CircularProgressIndicator(
                                              color: Colors.black,
                                            )
                                          : Icon(
                                              Icons.remove,
                                              color: AppColors.greyColor,
                                            ),
                                    ),
                                  ),
                                ),
                                10.pw,
                                Text(
                                  "${widget.cartItem.quantity}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: AppColors.blackColor),
                                ),
                                10.pw,
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape
                                        .circle, // Maintain the circular shape
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(
                                            0.5), // Shadow color with transparency
                                        blurRadius:
                                            5.0, // Adjust blur radius for softness
                                        spreadRadius:
                                            2.0, // Optional: adjust spread for size
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<CartCubit>()
                                          .cahngeclcikedCartId(
                                              widget.cartItem.id);
                                      if (state.laodingUpdateItem &&
                                          state.clcikedCartId ==
                                              widget.cartItem.id) {
                                      } else {
                                        setState(() {
                                          widget.cartItem.quantity = (int.parse(
                                                      widget
                                                          .cartItem.quantity!) +
                                                  1)
                                              .toString();
                                        });
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(context, "+1",
                                                widget.cartItem.id.toString());
                                        context
                                            .read<CartCubit>()
                                            .addToTotalPrice(double.parse(widget
                                                .cartItem
                                                .product!
                                                .finalPrice!));
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: state.laodingUpdateItem &&
                                              state.clcikedCartId ==
                                                  widget.cartItem.id
                                          ? CircularProgressIndicator(
                                              color: Colors.black,
                                            )
                                          : Icon(Icons.add,
                                              color: AppColors.greyColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            BlocBuilder<LocaleCubit, LocaleState>(
                              builder: (context, locale) {
                                return Text(
                                    "${(formatCurrency.format(double.parse(widget.cartItem.product!.finalPrice!) * double.parse(widget.cartItem.quantity!)))} ${locale.locale.languageCode == "ar" ? widget.cartItem.product!.symbol_ar : widget.cartItem.product!.symbol_en}",
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500));
                              },
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
