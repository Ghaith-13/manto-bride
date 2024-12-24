import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';

class ProductDetailsBottomNavigation extends StatefulWidget {
  const ProductDetailsBottomNavigation({super.key});

  @override
  State<ProductDetailsBottomNavigation> createState() =>
      _ProductDetailsBottomNavigationState();
}

class _ProductDetailsBottomNavigationState
    extends State<ProductDetailsBottomNavigation> {
  bool showCount = false;
  int count = 1;
  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  String? token;
  bool loadingToken = false;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    setState(() {
      loadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loadingToken
        ? SizedBox()
        : BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColors,
                          ),
                          onPressed: () {
                            if (showCount == false) {
                              if (token == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.only(
                                        bottom: 30.h,
                                        top: 30.h,
                                        left: 50.w,
                                        right: 50.w),
                                    content: Text(
                                      "Log in to enjoy these features.".tr(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                context
                                    .read<HomeCubit>()
                                    .changedimensions("Other");
                                context
                                    .read<HomeCubit>()
                                    .changeselectedWeight("Other");

                                if (state.productData!.product!.colors ==
                                    null) {
                                  context
                                      .read<HomeCubit>()
                                      .changeColorSelected("Other");
                                }
                                if (state
                                    .productData!.product!.colors!.isEmpty) {
                                  context
                                      .read<HomeCubit>()
                                      .changeColorSelected("Other");
                                }

                                if (state.productData!.product!.sizes == null) {
                                  context
                                      .read<HomeCubit>()
                                      .changeSelectedSize("Other");
                                }
                                if (state
                                    .productData!.product!.sizes!.isEmpty) {
                                  context
                                      .read<HomeCubit>()
                                      .changeSelectedSize("Other");
                                }

                                //////////////////////////////////////////
                                if (state.selectedColor.isEmpty &&
                                    state.productData!.product!.colors!
                                        .isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.only(
                                          bottom: 30.h,
                                          top: 30.h,
                                          left: 50.w,
                                          right: 50.w),
                                      content: Text(
                                        "Choose a color for the product".tr(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                                // if (state.selectedColor.isEmpty &&
                                //     state.productData!.product!.colors!
                                //         .isEmpty) {
                                //   context
                                //       .read<HomeCubit>()
                                //       .changeColorSelected("Other");
                                // }
                                // if (state.selectedSize.isEmpty &&
                                //     state
                                //         .productData!.product!.sizes!.isEmpty) {
                                //   context
                                //       .read<HomeCubit>()
                                //       .changeSelectedSize("Other");
                                // }
                                if (state.selectedSize.isEmpty &&
                                    state.productData!.product!.sizes!
                                        .isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.only(
                                          bottom: 30.h,
                                          top: 30.h,
                                          left: 50.w,
                                          right: 50.w),
                                      content: Text(
                                        "Select a product size".tr(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                                // if (state.selectedWeight.isEmpty &&
                                //     state.productData!.product!.weights!
                                //         .isEmpty) {
                                //   context
                                //       .read<HomeCubit>()
                                //       .changeselectedWeight("Other");
                                // }
                                // if (state.selectedWeight.isEmpty &&
                                //     state.productData!.product!.weights!
                                //         .isNotEmpty) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       backgroundColor: Colors.red,
                                //       padding: EdgeInsets.only(
                                //           bottom: 30.h,
                                //           top: 30.h,
                                //           left: 50.w,
                                //           right: 50.w),
                                //       content: Text(
                                //         "Select a product weight".tr(),
                                //         style: const TextStyle(
                                //             color: Colors.white),
                                //       ),
                                //       duration: const Duration(seconds: 2),
                                //     ),
                                //   );
                                // }
                                // if (state.dimensions.isEmpty &&
                                //     state.productData!.product!.dimensions!
                                //         .isEmpty) {
                                //   context
                                //       .read<HomeCubit>()
                                //       .changedimensions("Other");
                                // }
                                // if (state.dimensions.isEmpty &&
                                //     state.productData!.product!.dimensions!
                                //         .isNotEmpty) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       backgroundColor: Colors.red,
                                //       padding: EdgeInsets.only(
                                //           bottom: 30.h,
                                //           top: 30.h,
                                //           left: 50.w,
                                //           right: 50.w),
                                //       content: Text(
                                //         "Select a product dimensions"
                                //             .tr(),
                                //         style: const TextStyle(
                                //             color: Colors.white),
                                //       ),
                                //       duration: const Duration(seconds: 2),
                                //     ),
                                //   );
                                // }

                                if (state.selectedColor.isNotEmpty &&
                                    state.selectedSize.isNotEmpty &&
                                    state.selectedWeight.isNotEmpty &&
                                    state.dimensions.isNotEmpty) {
                                  setState(() {
                                    showCount = true;
                                  });
                                }
                              }
                            } else {
                              if (state.loadingAddToCart) {
                              } else {
                                context.read<HomeCubit>().addToCart(
                                    state.productData!.product!.id!.toString(),
                                    count.toString());
                                setState(() {
                                  showCount = false;
                                });
                              }

                              // AppConstant.customNavigation(
                              //     context, RatingScreen(), -1, 1);
                            }
                          },
                          child: state.loadingAddToCart
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "ADD TO CART".tr(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )),
                    ),
                    showCount
                        ? Row(
                            children: [
                              5.pw,
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count = count + 1;
                                  });
                                },
                                child: CircleAvatar(
                                    backgroundColor: AppColors.buttonColors,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                              5.pw,
                              Text(
                                "$count",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              5.pw,
                              InkWell(
                                onTap: () {
                                  if (count == 1) {
                                  } else {
                                    setState(() {
                                      count = count - 1;
                                    });
                                  }
                                },
                                child: CircleAvatar(
                                    backgroundColor: AppColors.buttonColors,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                              ),
                              5.pw,
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              );
            },
          );
  }
}
