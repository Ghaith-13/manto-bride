// import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_cubit.dart';
// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_state.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:manto_bride/Locale/app_localization.dart';
// import 'package:manto_bride/core/extensions/padding_extensions.dart';
// import 'package:manto_bride/core/utils/app_colors.dart';
// import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';

// class HeaderSection extends StatefulWidget {
//   HeaderSection({super.key});

//   @override
//   State<HeaderSection> createState() => _HeaderSectionState();
// }

// class _HeaderSectionState extends State<HeaderSection> {
//   // int activeTabIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         return BlocBuilder<FavoriteCubit, FavoriteState>(
//           builder: (context, value) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 5.0,
//                     spreadRadius: 1.0,
//                     offset: Offset(0.0, 5.0),
//                   ),
//                 ],
//               ),
//               width: 1.sw,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 14.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     state.showmeshProducts
//                         ? SizedBox()
//                         : Text(
//                             "Favorites".tr(),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.blackColor,
//                                 fontSize: 34.sp),
//                           ),
//                     10.ph,
//                     SizedBox(
//                       height: 100.h,
//                       child: ListView.builder(
//                         itemCount: value.favoriteData == null
//                             ? 0
//                             : value.favoriteData!.length,
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               context
//                                   .read<FavoriteCubit>()
//                                   .changeSubCategoryId(index);
//                               context
//                                   .read<FavoriteCubit>()
//                                   .changeactiveTabIndex(index);
//                             },
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsetsDirectional.only(end: 10),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               color:
//                                                   value.activeTabIndex == index
//                                                       ? AppColors.primaryColor
//                                                       : Colors.transparent,
//                                               width: 2.0,
//                                             ),
//                                           ),
//                                           child: CachedNetworkImage(
//                                             width: 60,
//                                             height: 60,
//                                             fit: BoxFit.cover,
//                                             imageUrl: value.favoriteData![index]
//                                                     .imageUrl ??
//                                                 "",
//                                             errorWidget: (context, name,
//                                                     imageProvider) =>
//                                                 Container(
//                                               margin:
//                                                   EdgeInsetsDirectional.only(
//                                                       end: 10),
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 15),
//                                               // height: 110,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 shape: BoxShape.circle,
//                                                 border: Border.all(
//                                                   color: value.activeTabIndex ==
//                                                           index
//                                                       ? AppColors.primaryColor
//                                                       : Colors.transparent,
//                                                   width: 5.0,
//                                                 ),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.grey
//                                                         .withOpacity(0.3),
//                                                     blurRadius: 7.0,
//                                                     spreadRadius: 1.0,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // image:

//                                               child: Image.asset(
//                                                 "assets/images/logo.jpg",
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             imageBuilder:
//                                                 (context, imageProvider) =>
//                                                     ClipOval(
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.r),
//                                                   image: DecorationImage(
//                                                     image: imageProvider,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   5.verticalSpace,
//                                   BlocBuilder<LocaleCubit, LocaleState>(
//                                     builder: (context, locale) {
//                                       return Text(
//                                         locale.locale.languageCode == "en"
//                                             ? value.favoriteData![index]
//                                                     .nameEn ??
//                                                 ""
//                                             : locale.locale.languageCode == "ar"
//                                                 ? value.favoriteData![index]
//                                                         .nameAr ??
//                                                     ""
//                                                 : value.favoriteData![index]
//                                                         .nameKu ??
//                                                     "",
//                                         // overflow: TextOverflow.fade,
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold),
//                                       );
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                             //  Container(
//                             //     margin: EdgeInsetsDirectional.only(end: 10),
//                             //     padding: EdgeInsets.symmetric(
//                             //       horizontal: 20,
//                             //     ),
//                             //     height: 30.sp,
//                             //     decoration: BoxDecoration(
//                             //       color: value.activeTabIndex == index
//                             //           ? AppColors.secondryColor
//                             //           : AppColors.blackColor,
//                             //       borderRadius: BorderRadius.circular(29.sp),
//                             //     ),
//                             //     child: BlocBuilder<LocaleCubit, LocaleState>(
//                             //       builder: (context, locale) {
//                             //         return Center(
//                             //           child: Text(
//                             //             locale.locale.languageCode == "en"
//                             //                 ? value.favoriteData![index].nameEn
//                             //                 : locale.locale.languageCode == "ar"
//                             //                     ? value
//                             //                         .favoriteData![index].nameAr
//                             //                     : value.favoriteData![index]
//                             //                         .nameKu,
//                             //             style: TextStyle(
//                             //                 fontSize: 14.sp,
//                             //                 fontWeight: FontWeight.w500,
//                             //                 color: value.activeTabIndex == index
//                             //                     ? AppColors.blackColor
//                             //                     : Colors.white),
//                             //           ),
//                             //         );
//                             //       },
//                             //     )),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
