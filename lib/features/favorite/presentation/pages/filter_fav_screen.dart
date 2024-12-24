// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_cubit.dart';
// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_state.dart';
// import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/colors_widget.dart';
// import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/dimensions_filter.dart';
// import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/sizes_fav_widget.dart';
// import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/weights_widget.dart';
// import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:manto_bride/Locale/app_localization.dart';
// import 'package:manto_bride/core/extensions/padding_extensions.dart';
// import 'package:manto_bride/core/utils/app_colors.dart';
// import 'package:manto_bride/core/utils/app_constant.dart';
// import 'package:manto_bride/features/home/presentation/widgets/filter_widgets/range_widget.dart';

// class FilterFavScreen extends StatefulWidget {
//   const FilterFavScreen({super.key});

//   @override
//   State<FilterFavScreen> createState() => _FilterFavScreenState();
// }

// class _FilterFavScreenState extends State<FilterFavScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     context.read<FavoriteCubit>().deleteFilter(context);
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "Discard".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: AppColors.blackColor),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     side: BorderSide(
//                       color: AppColors.blackColor,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               5.pw,
//               Expanded(
//                 child: BlocBuilder<FavoriteCubit, FavoriteState>(
//                   builder: (context, state) {
//                     return ElevatedButton(
//                       onPressed: () {
//                         if (state.loadingFilter) {
//                         } else {
//                           context
//                               .read<FavoriteCubit>()
//                               .getFavoritesProduct(context, fromFilter: true);
//                         }
//                       },
//                       child: state.loadingFilter
//                           ? CircularProgressIndicator(
//                               color: Colors.white,
//                             )
//                           : Text(
//                               "Apply".tr(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14.sp,
//                                   color: Colors.white),
//                             ),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               WidgetStatePropertyAll(AppColors.primaryColor)),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       appBar: AppConstant.customAppBar(
//         context,
//         "Filter",
//         true,
//         IconColor: AppColors.blackColor,
//         backgroundColor: Colors.white,
//         elvation: 5,
//       ),
//       body: BlocBuilder<FavoriteCubit, FavoriteState>(
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 30.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                               checkColor: Colors.white,
//                               activeColor: AppColors.primaryColor,
//                               value: state.filterFeature,
//                               onChanged: (value) {
//                                 context
//                                     .read<FavoriteCubit>()
//                                     .changefilterFeature();
//                               }),
//                           5.pw,
//                           Text("Feautred products".tr())
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                               activeColor: AppColors.primaryColor,
//                               checkColor: Colors.white,
//                               value: state.filterDiscount,
//                               onChanged: (value) {
//                                 context
//                                     .read<FavoriteCubit>()
//                                     .changefilterDiscount();
//                               }),
//                           5.pw,
//                           Text("Discount Products".tr())
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 10.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                   child: Text(
//                     "Price range".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: AppColors.blackColor),
//                   ),
//                 ),
//                 10.ph,
//                 state.favoriteData?[state.subCategoryId] == null
//                     ? SizedBox()
//                     : RangeWidget(
//                         subCategoryData: SubCategoryData(
//                             minPrice: state
//                                 .favoriteData![state.subCategoryId].minPrice,
//                             maxPrice: state
//                                 .favoriteData![state.subCategoryId].maxPrice)),
//                 30.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                   child: Text(
//                     "Colors".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: AppColors.blackColor),
//                   ),
//                 ),
//                 10.ph,
//                 ColorsFilterFavoriteWidget(),
//                 30.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                   child: Text(
//                     "Sizes".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: AppColors.blackColor),
//                   ),
//                 ),
//                 10.ph,
//                 SizesFavWidget(),
//                 30.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                   child: Text(
//                     "weights".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: AppColors.blackColor),
//                   ),
//                 ),
//                 10.ph,
//                 WeightsFavWidget(),
//                 30.ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                   child: Text(
//                     "dimensions".tr(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: AppColors.blackColor),
//                   ),
//                 ),
//                 10.ph,
//                 dimensionsFavWidget(),

//                 // Padding(
//                 //   padding: EdgeInsets.symmetric(horizontal: 12.w),
//                 //   child: Text(
//                 //     "Category".tr(),
//                 //     style: TextStyle(
//                 //         fontWeight: FontWeight.w600,
//                 //         fontSize: 16.sp,
//                 //         color: AppColors.blackColor),
//                 //   ),
//                 // ),
//                 // 10.ph,
//                 // CategoryFilterWidget()
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
