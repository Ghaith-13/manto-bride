// ignore_for_file: must_be_immutable

import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/favorite/data/models/favorite_model.dart';
import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/favorite_card_image.dart';
import 'package:manto_bride/features/home/presentation/pages/product_details_screen.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

class FavoriteCardWidget extends StatefulWidget {
  bool soldOut;
  final FavoriteProduct favoriteProduct;
  FavoriteCardWidget(
      {super.key, this.soldOut = false, required this.favoriteProduct});

  @override
  State<FavoriteCardWidget> createState() => _FavoriteCardWidgetState();
}

class _FavoriteCardWidgetState extends State<FavoriteCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
            onTap: () {
              AppConstant.customNavigation(
                  context,
                  ProductDetailsScreen(
                    productId: widget.favoriteProduct.id.toString(),
                  ),
                  -1,
                  0);
            },
            child: SizedBox(
              // height: 260.h,
              width: 150.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8.0.sp),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.sp),
                          ),
                          child: FavoriteCardImage(
                            soldOut: widget.soldOut,
                            favoriteProduct: widget.favoriteProduct,
                            haveOffer: widget.favoriteProduct.isDiscount!,
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StarsWidget(
                            reviewAvg: widget.favoriteProduct.reviewAvg,
                            reviewCount: widget.favoriteProduct.reviewCount,
                          ),
                          // 2.ph,
                          // Text(
                          //   "Mango",
                          //   style: TextStyle(
                          //       fontSize: 11.sp,
                          //       color: AppColors.greyColor,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          2.ph,
                          BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, loacle) {
                              return Text(
                                loacle.locale.languageCode == "en"
                                    ? widget.favoriteProduct.nameEn
                                    : loacle.locale.languageCode == "ar"
                                        ? widget.favoriteProduct.nameAr
                                        : widget.favoriteProduct.nameKu,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600),
                              );
                            },
                          ),
                          // 2.ph,
                          // // Row(
                          // //   children: [
                          // //     Text(
                          // //       "${"Color".tr()} :",
                          // //       style: TextStyle(
                          // //           fontSize: 11.sp,
                          // //           fontWeight: FontWeight.w400,
                          // //           color: AppColors.greyColor),
                          // //     ),
                          // //     5.pw,
                          // //     Text(
                          // //       "Gray",
                          // //       style: TextStyle(
                          // //           fontSize: 11.sp,
                          // //           fontWeight: FontWeight.w400,
                          // //           color: AppColors.blackColor),
                          // //     ),
                          //     30.pw,
                          //     Text(
                          //       "${"Size".tr()} :",
                          //       style: TextStyle(
                          //           fontSize: 11.sp,
                          //           fontWeight: FontWeight.w400,
                          //           color: AppColors.greyColor),
                          //     ),
                          //     5.pw,
                          //     Text(
                          //       "L",
                          //       style: TextStyle(
                          //           fontSize: 11.sp,
                          //           fontWeight: FontWeight.w400,
                          //           color: AppColors.blackColor),
                          //     ),
                          //   ],
                          // ),
                          2.ph,
                          ProductPriceWidget(
                            productDetails: Products(
                                finalPrice: widget.favoriteProduct.finalPrice,
                                price: widget.favoriteProduct.price,
                                discount: widget.favoriteProduct.discount),
                            haveOffer: widget.favoriteProduct.isDiscount!,
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            )),
        widget.soldOut
            ? ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  width: 1.sw,
                  color: const Color.fromARGB(185, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1.sw,
                        color: Colors.white,
                        child: Text(
                          "Sorry, this item is currently sold out".tr(),
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
