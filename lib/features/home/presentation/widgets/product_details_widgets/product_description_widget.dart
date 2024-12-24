import 'package:flutter_svg/svg.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/pages/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/stars_widget.dart';
import 'package:intl/intl.dart';

class ProductDescriptionWidget extends StatefulWidget {
  final String? token;
  const ProductDescriptionWidget({super.key, required this.token});

  @override
  State<ProductDescriptionWidget> createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, locale) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                locale.locale.languageCode == "en"
                                    ? state.productData!.product!.nameEn ?? ""
                                    : locale.locale.languageCode == "ar"
                                        ? state.productData!.product!.nameAr ??
                                            ""
                                        : state.productData!.product!.nameKu ??
                                            "",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: 36.0.sp,
                                      height: 36.0.sp,
                                      decoration: BoxDecoration(
                                        // border: Border.all(
                                        //   color: AppColors.blackColor,
                                        //   width: 1.0,
                                        // ),
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.token == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                padding: EdgeInsets.only(
                                                    bottom: 30.h,
                                                    top: 30.h,
                                                    left: 50.w,
                                                    right: 50.w),
                                                content: Text(
                                                  "Log in to enjoy these features."
                                                      .tr(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    const Duration(seconds: 2),
                                              ),
                                            );
                                          } else {
                                            context
                                                .read<HomeCubit>()
                                                .toggleFavorite(
                                                    state.productData!.product!
                                                        .id
                                                        .toString(),
                                                    fromProductDetails: true);
                                          }
                                        },
                                        child: state.productData!.product!
                                                .isFavorite!
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 18.sp,
                                              )
                                            : SvgPicture.asset(
                                                "assets/icons/favorite.svg",
                                                width: 24.sp,
                                                height: 24.sp,
                                              ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  state.productData!.product!.isDiscount!
                      ? Row(
                          children: [
                            Text(
                                '${(formatCurrency.format(double.parse(state.productData!.product!.price!)))} ${locale.locale.languageCode == "ar" ? state.productData!.product!.symbol_ar : state.productData!.product!.symbol_en}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 18.sp,
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w500)),
                            20.pw,
                            Text(
                              "${(formatCurrency.format(double.parse(state.productData!.product!.finalPrice!)))} ${locale.locale.languageCode == "ar" ? state.productData!.product!.symbol_ar : state.productData!.product!.symbol_en}",
                              style: TextStyle(
                                  color: AppColors.redColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      : Text(
                          "${(formatCurrency.format(double.parse(state.productData!.product!.finalPrice!)))} ${locale.locale.languageCode == "ar" ? state.productData!.product!.symbol_ar : state.productData!.product!.symbol_en}",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                  Text(
                    locale.locale.languageCode == "en"
                        ? state.productData!.product!.paragraphEn ?? ""
                        : locale.locale.languageCode == "ar"
                            ? state.productData!.product!.paragraphAr ?? ""
                            : state.productData!.product!.paragraphKu ?? "",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor),
                  ),
                  5.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarsWidget(
                        reviewAvg: state.productData!.product!.reviewAvg ?? 0,
                        reviewCount:
                            state.productData!.product!.reviewCount ?? 0,
                      ),
                      InkWell(
                        onTap: () {
                          AppConstant.customNavigation(
                              context,
                              RatingScreen(
                                finalRating:
                                    state.productData!.product!.reviewAvg,
                                reviews: state.productData!.product!.reviews,
                              ),
                              -1,
                              0);
                        },
                        child: Text(
                          "${"Show details".tr()} >",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
