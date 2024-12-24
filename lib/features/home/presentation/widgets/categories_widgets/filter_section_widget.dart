import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/home/presentation/pages/brand_filter_screen.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/pages/filter_screen.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/sorting_bottom_sheet.dart';

class FilterSectionWidget extends StatefulWidget {
  final String title;
  final String categoryId;

  FilterSectionWidget(
      {super.key, required this.title, required this.categoryId});

  @override
  State<FilterSectionWidget> createState() => _FilterSectionWidgetState();
}

class _FilterSectionWidgetState extends State<FilterSectionWidget> {
  // int activeTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.showmeshProducts
                        ? SizedBox()
                        : Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                                fontSize: 34.sp),
                          ),
                    10.ph,
                    SizedBox(
                      height: 100.sp,
                      child: ListView.builder(
                        itemCount: state.subCategoriesData == null
                            ? 0
                            : state.subCategoriesData!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsDirectional.only(end: 20),
                            child: InkWell(
                              onTap: () {
                                // setState(() {
                                //   activeTabIndex = index;
                                // });
                                context
                                    .read<HomeCubit>()
                                    .cahngeactiveTabIndex(index);
                                context
                                    .read<HomeCubit>()
                                    .changeSubCategoryId(index);
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsetsDirectional.only(end: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: state.activeTabIndex ==
                                                        index
                                                    ? AppColors.primaryColor
                                                    : Colors.transparent,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: CachedNetworkImage(
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                              imageUrl: state
                                                      .subCategoriesData![index]
                                                      .imageUrl ??
                                                  "",
                                              errorWidget: (context, name,
                                                      imageProvider) =>
                                                  Container(
                                                // margin:
                                                //     EdgeInsetsDirectional.only(
                                                //         end: 10),
                                                // padding: EdgeInsets.symmetric(
                                                //     vertical: 20,
                                                //     horizontal: 15),
                                                // height: 110,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    // color:
                                                    //     state.activeTabIndex ==
                                                    //             index
                                                    //         ? AppColors
                                                    //             .primaryColor
                                                    //         : Colors
                                                    //             .transparent,
                                                    width: 5.0,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      blurRadius: 7.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                  ],
                                                ),
                                                // image:

                                                child: ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/logo.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      ClipOval(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    5.verticalSpace,
                                    BlocBuilder<LocaleCubit, LocaleState>(
                                      builder: (context, locale) {
                                        return Text(
                                          locale.locale.languageCode == "en"
                                              ? state.subCategoriesData![index]
                                                      .nameEn ??
                                                  ""
                                              : locale.locale.languageCode ==
                                                      "ar"
                                                  ? state
                                                          .subCategoriesData![
                                                              index]
                                                          .nameAr ??
                                                      ""
                                                  : state
                                                          .subCategoriesData![
                                                              index]
                                                          .nameKu ??
                                                      "",
                                          // overflow: TextOverflow.fade,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              // Container(
                              //     margin: EdgeInsetsDirectional.only(end: 10),
                              //     padding: EdgeInsets.symmetric(
                              //       horizontal: 20,
                              //     ),
                              //     height: 30.sp,
                              //     decoration: BoxDecoration(
                              //       color: state.activeTabIndex == index
                              //           ? AppColors.secondryColor
                              //           : AppColors.blackColor,
                              //       borderRadius: BorderRadius.circular(29.sp),
                              //     ),
                              //     child: Center(
                              //       child: BlocBuilder<LocaleCubit, LocaleState>(
                              //         builder: (context, locale) {
                              //           return Text(
                              //             locale.locale.languageCode == "en"
                              //                 ? state.subCategoriesData![index]
                              //                         .nameEn ??
                              //                     ""
                              //                 : locale.locale.languageCode == "ar"
                              //                     ? state
                              //                             .subCategoriesData![
                              //                                 index]
                              //                             .nameAr ??
                              //                         ""
                              //                     : state
                              //                             .subCategoriesData![
                              //                                 index]
                              //                             .nameKu ??
                              //                         "",
                              //             style: TextStyle(
                              //                 fontSize: 14.sp,
                              //                 fontWeight: FontWeight.w500,
                              //                 color: state.activeTabIndex == index
                              //                     ? AppColors.blackColor
                              //                     : Colors.white),
                              //           );
                              //         },
                              //       ),
                              //     )),
                            ),
                          );
                        },
                      ),
                    ),
                    15.ph,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 0.9.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                AppConstant.customNavigation(
                                    context,
                                    FilterScreen(categoryId: widget.categoryId),
                                    0,
                                    -1);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/filter.svg',
                                    width: 24.sp,
                                    height: 24.sp,
                                  ),
                                  5.pw,
                                  Text(
                                    "Filters".tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8.sp),
                                  )
                                ],
                              ),
                            ),
                            2.pw,
                            InkWell(
                              onTap: () {
                                AppConstant.customNavigation(
                                    context,
                                    BrandFilterScreen(
                                      categoryId: widget.categoryId,
                                    ),
                                    0,
                                    -1);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/filter.svg',
                                    width: 24.sp,
                                    height: 24.sp,
                                  ),
                                  5.pw,
                                  Text(
                                    "Filters by brand".tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8.sp),
                                  )
                                ],
                              ),
                            ),
                            2.pw,
                            InkWell(
                              onTap: () {
                                showFlexibleBottomSheet(
                                  bottomSheetColor: AppColors.whiteColor,
                                  barrierColor: Color.fromARGB(94, 83, 83, 83),
                                  bottomSheetBorderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.sp),
                                      topRight: Radius.circular(40.sp)),
                                  minHeight: 0,
                                  initHeight: 0.4,
                                  maxHeight: 0.4,
                                  anchors: [0, 0.4],
                                  isSafeArea: true,
                                  context: context,
                                  builder: sortingProductsBotomSheet,
                                );
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/sort.svg',
                                    width: 24.sp,
                                    height: 24.sp,
                                  ),
                                  5.pw,
                                  Text("${state.sortName}".tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8.sp))
                                ],
                              ),
                            ),
                            2.pw,
                            InkWell(
                              onTap: () {
                                context.read<HomeCubit>().changeShowMesh();
                              },
                              child: SvgPicture.asset(
                                state.showmeshProducts == false
                                    ? 'assets/icons/mish.svg'
                                    : 'assets/icons/list.svg',
                                width: 24.sp,
                                height: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    15.ph
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
