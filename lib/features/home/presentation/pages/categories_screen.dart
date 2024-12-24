// ignore_for_file: deprecated_member_use

import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/features/home/presentation/pages/categories_skeleton.dart';
import 'package:manto_bride/features/home/presentation/pages/search_screen.dart';
import 'package:manto_bride/main_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/filter_section_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_list_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryId, title;
  const CategoriesScreen(
      {super.key, required this.categoryId, required this.title});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSubCategoriesInfo(widget.categoryId);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<HomeCubit>().getSubCategoriesInfo(widget.categoryId);
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<HomeCubit>().changePageNumberForSub(1);
    context.read<HomeCubit>().changeSubCategoryId(0);
    context.read<HomeCubit>().removeAllFilters();
    context.read<HomeCubit>().cahngesearchValue("");
    context.read<HomeCubit>().cahngeactiveTabIndex(0);
    context.read<HomeCubit>().cahngedontshowSearchIcon(false);

    // context.read<HomeCubit>().ChangeCategoryIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppConstant.customAppBar(
              context, state.showmeshProducts ? widget.title : "", true,
              withTranslate: false,
              IconColor: AppColors.blackColor,
              backgroundColor: Colors.white,
              elvation: 0,
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 15.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    mainScreen(navigateIndex: 2)),
                            (Route route) => false,
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/basket.svg",
                          width: 25.sp,
                          height: 25.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                      10.horizontalSpace,
                      state.dontshowSearchIcon
                          ? InkWell(
                              onTap: () {
                                context
                                    .read<HomeCubit>()
                                    .EditeVariableForSearch();
                                context.read<HomeCubit>().cahngesearchValue("");
                                context
                                    .read<HomeCubit>()
                                    .cahngedontshowSearchIcon(false);
                                context
                                    .read<HomeCubit>()
                                    .getSubCategoriesInfo(widget.categoryId);
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 24.sp,
                                color: AppColors.blackColor,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        TypeaheadExample(
                                      categorryId: widget.categoryId,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.search,
                                size: 24.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                    ],
                  ),
                )
              ]),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.loadingSubCateogries
                  ? CategoriesSkeleton()
                  : state.subCategoriesData == null
                      ? CategoriesSkeleton()
                      : state.subCategoriesData == null
                          ? Center(
                              child: Column(
                              children: [
                                Lottie.asset('assets/images/empty_data.json'),
                                Text(
                                  "Sorry, there are no products.".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ],
                            ))
                          : state.subCategoriesData!.isEmpty
                              ? Center(
                                  child: Column(
                                  children: [
                                    Lottie.asset(
                                        'assets/images/empty_data.json'),
                                    Text(
                                      "Sorry, there are no products.".tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                  ],
                                ))
                              : SingleChildScrollView(
                                  controller: controller,
                                  child: Column(
                                    children: [
                                      FilterSectionWidget(
                                          title: widget.title,
                                          categoryId: widget.categoryId),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.w),
                                        child: state.showmeshProducts == false
                                            ? ListView.builder(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: state
                                                            .subCategoriesData![
                                                                state
                                                                    .subCategoryId]
                                                            .products ==
                                                        null
                                                    ? 0
                                                    : state
                                                            .subCategoriesData![
                                                                state
                                                                    .subCategoryId]
                                                            .products!
                                                            .length +
                                                        1,
                                                itemBuilder: (context, index) {
                                                  if (index ==
                                                      state
                                                          .subCategoriesData![
                                                              state
                                                                  .subCategoryId]
                                                          .products!
                                                          .length) {
                                                    return index == 0
                                                        ? Center(
                                                            child: Column(
                                                            children: [
                                                              Lottie.asset(
                                                                  'assets/images/empty_data.json'),
                                                              Text(
                                                                "Sorry, there are no products."
                                                                    .tr(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.sp),
                                                              ),
                                                            ],
                                                          ))
                                                        : index % 20 == 0
                                                            ? Shimmer
                                                                .fromColors(
                                                                    baseColor: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    highlightColor:
                                                                        Colors
                                                                            .grey
                                                                            .shade100,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.sp),
                                                                      child:
                                                                          Container(
                                                                        color: Colors
                                                                            .black,
                                                                        width: 1
                                                                            .sw,
                                                                        height:
                                                                            104.sp,
                                                                      ),
                                                                    ))
                                                            : SizedBox();
                                                  } else {
                                                    return index % 2 == 0
                                                        ? FadeInLeft(
                                                            child:
                                                                ProductListWidget(
                                                            productDetails: state
                                                                .subCategoriesData![
                                                                    state
                                                                        .subCategoryId]
                                                                .products![index],
                                                          ))
                                                        : FadeInRight(
                                                            child:
                                                                ProductListWidget(
                                                            productDetails: state
                                                                .subCategoriesData![
                                                                    state
                                                                        .subCategoryId]
                                                                .products![index],
                                                          ));
                                                  }
                                                },
                                              )
                                            : state
                                                        .subCategoriesData![
                                                            state.subCategoryId]
                                                        .products!
                                                        .length ==
                                                    0
                                                ? Center(
                                                    child: Column(
                                                    children: [
                                                      Lottie.asset(
                                                        'assets/images/empty_data.json',
                                                      ),
                                                      Text(
                                                        "Sorry, there are no products."
                                                            .tr(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                    ],
                                                  ))
                                                : GridView.count(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    childAspectRatio: (1 / 2),
                                                    children: List.generate(
                                                        state
                                                                    .subCategoriesData![
                                                                        state
                                                                            .subCategoryId]
                                                                    .products ==
                                                                null
                                                            ? 0
                                                            : state
                                                                    .subCategoriesData![
                                                                        state
                                                                            .subCategoryId]
                                                                    .products!
                                                                    .length +
                                                                2, (index) {
                                                      if (index >=
                                                          state
                                                              .subCategoriesData![
                                                                  state
                                                                      .subCategoryId]
                                                              .products!
                                                              .length) {
                                                        return index % 20 == 0
                                                            ? Shimmer
                                                                .fromColors(
                                                                    baseColor: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    highlightColor:
                                                                        Colors
                                                                            .grey
                                                                            .shade100,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.sp),
                                                                      child:
                                                                          Container(
                                                                        color: Colors
                                                                            .black,
                                                                        width: 0.4
                                                                            .sw,
                                                                        height:
                                                                            100.h,
                                                                      ),
                                                                    ))
                                                            : SizedBox();
                                                      } else
                                                        return index %
                                                                    2 ==
                                                                0
                                                            ? FadeInLeft(
                                                                child: ProductCardWidget(
                                                                    productDetails: state
                                                                            .subCategoriesData![state
                                                                                .subCategoryId]
                                                                            .products![
                                                                        index]))
                                                            : FadeInRight(
                                                                child: ProductCardWidget(
                                                                    productDetails: state
                                                                        .subCategoriesData![
                                                                            state.subCategoryId]
                                                                        .products![index]));
                                                    }),
                                                  ),
                                      )
                                    ],
                                  ),
                                );
            },
          ),
        );
      },
    );
  }
}
