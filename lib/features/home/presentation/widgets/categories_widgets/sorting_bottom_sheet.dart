import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';

Widget sortingProductsBotomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
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
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Popular");
                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                List<Products>? product = [];
                for (int i = 0;
                    i <
                        state.subCategoriesData![state.subCategoryId].products!
                            .length;
                    i++) {
                  if (state.subCategoriesData![state.subCategoryId].products![i]
                          .isFeatured ==
                      "1") {
                    product.add(state
                        .subCategoriesData![state.subCategoryId].products![i]);
                  }
                }

                newsubCategoriesData[state.subCategoryId].products = [];
                newsubCategoriesData[state.subCategoryId].products = product;
                context.read<HomeCubit>().changeSubCategory([]);
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color:
                    state.sortName == "Popular" ? AppColors.primaryColor : null,
                child: Row(
                  children: [
                    Text(
                      "Popular".tr(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: state.sortName == "Popular"
                              ? Colors.white
                              : AppColors.blackColor),
                    ),
                  ],
                ),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Newest");
                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId].products!.sort(
                    (b, a) => DateTime.parse(a.createdAt ?? "")
                        .compareTo(DateTime.parse(b.createdAt ?? "")));
                context.read<HomeCubit>().changeSubCategory([]);
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color:
                    state.sortName == "Newest" ? AppColors.primaryColor : null,
                child: Row(children: [
                  Text(
                    "Newest".tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Newest"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Customer Review");

                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId]
                    .products!
                    .sort((b, a) => a.reviewAvg!.compareTo(b.reviewAvg!));
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Customer Review"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Customer Review".tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Customer Review"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context
                    .read<HomeCubit>()
                    .changeSortName("Price : lowest to high");
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId]
                    .products!
                    .sort((b, a) => b.finalPrice.compareTo(a.finalPrice));
                context.read<HomeCubit>().changeSubCategory([]);
                Future.delayed(Duration(seconds: 3));

                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                Navigator.pop(context);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Price : lowest to high"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Price : lowest to high".tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: state.sortName == "Price : lowest to high"
                          ? Colors.white
                          : AppColors.blackColor,
                    ),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context
                    .read<HomeCubit>()
                    .changeSortName("Price : highest to low");

                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId]
                    .products!
                    .sort((b, a) => a.finalPrice.compareTo(b.finalPrice));
                context.read<HomeCubit>().changeSubCategory([]);
                Future.delayed(Duration(seconds: 3));

                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                Navigator.pop(context);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Price : highest to low"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Price : highest to low".tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Price : highest to low"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
          ],
        );
      },
    ),
  );
}
