// import 'dart:convert';
// import 'package:manto_bride/Locale/app_localization.dart';
// import 'package:manto_bride/core/extensions/padding_extensions.dart';
// import 'package:manto_bride/core/utils/app_colors.dart';
// import 'package:manto_bride/core/utils/app_constant.dart';
// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_cubit.dart';
// import 'package:manto_bride/features/favorite/presentation/cubit/favorite_state.dart';
// import 'package:azlistview/azlistview.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FilterBrandFav extends StatefulWidget {
//   const FilterBrandFav({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ContactsPageState createState() => _ContactsPageState();
// }

// class _ContactsPageState extends State<FilterBrandFav> {
//   List<ContactInfo> contactList = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _handleList(List<ContactInfo> list) {
//     if (list.isEmpty) return;
//     for (int i = 0, length = list.length; i < length; i++) {
//       String tag = list[i].name.substring(0, 1).toUpperCase();
//       list[i].namePinyin = list[i].name;
//       if (RegExp("[A-Z]").hasMatch(tag)) {
//         list[i].tagIndex = tag;
//       } else {
//         list[i].tagIndex = "#";
//       }
//     }
//     // A-Z sort.
//     SuspensionUtil.sortListBySuspensionTag(contactList);

//     // show sus tag.
//     SuspensionUtil.setShowSuspensionStatus(contactList);

//     setState(() {});
//   }

//   // Widget getWeChatListItem(
//   //   BuildContext context,
//   //   ContactInfo model, {
//   //   double susHeight = 40,
//   //   Color? defHeaderBgColor,
//   // }) {
//   //   return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
//   // }

//   // static String getImgPath(String name, {String format = 'png'}) {
//   //   return 'assets/images/$name.$format';
//   // }

//   // Widget getWeChatItem(
//   //   BuildContext context,
//   //   ContactInfo model, {
//   //   Color? defHeaderBgColor,
//   // }) {
//   //   return;
//   // }

//   int dofunction = 0;
//   @override
//   Widget build(BuildContext context) {
//     if (dofunction == 0) {
//       final state = context.select((FavoriteCubit myCubit) => myCubit.state);
//       if (state.brands != null) {
//         for (var v in state.brands!) {
//           contactList.add(ContactInfo.fromJson(
//               {"name": v.name, "img": v.logo, "id": v.id}));
//         }
//         _handleList(contactList);
//         setState(() {
//           dofunction = dofunction + 1;
//         });
//       }
//     }

//     return Scaffold(
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
//         "Filter by brand",
//         true,
//         IconColor: AppColors.blackColor,
//         backgroundColor: Colors.white,
//         elvation: 5,
//       ),
//       body: AzListView(
//         data: contactList,
//         itemCount: contactList.length,
//         itemBuilder: (BuildContext context, int index) {
//           ContactInfo model = contactList[index];
//           return BlocBuilder<FavoriteCubit, FavoriteState>(
//             builder: (context, state) {
//               return InkWell(
//                 onTap: () {
//                   context
//                       .read<FavoriteCubit>()
//                       .dealWithListIdForBrand(model.id ?? "");
//                   setState(() {});
//                 },
//                 child: Container(
//                     color: state.selectedlistbrandId == null
//                         ? Colors.white
//                         : state.selectedlistbrandId!.contains(model.id)
//                             ? AppColors.primaryColor
//                             : Colors.white,
//                     margin: const EdgeInsets.only(
//                         right: 10, bottom: 20, left: 10, top: 10),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                             child: CachedNetworkImage(
//                           width: 104.sp,
//                           height: 104.sp,
//                           fit: BoxFit.fill,
//                           imageUrl: model.img ?? '',
//                           imageBuilder: (context, imageProvider) => Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: imageProvider,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         )),
//                         10.pw,
//                         Text(
//                           model.name,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: state.selectedlistbrandId == null
//                                 ? Colors.black
//                                 : state.selectedlistbrandId!.contains(model.id)
//                                     ? Colors.white
//                                     : Colors.black,
//                           ),
//                         )
//                       ],
//                     )),
//               );
//             },
//           );
//         },
//         physics: const BouncingScrollPhysics(),
//         indexBarData: SuspensionUtil.getTagIndexList(contactList),
//         indexBarOptions: IndexBarOptions(
//           needRebuild: true,
//           ignoreDragCancel: true,
//           downTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
//           downItemDecoration: const BoxDecoration(
//               shape: BoxShape.circle, color: AppColors.primaryColor),
//           indexHintWidth: 120 / 2,
//           indexHintHeight: 100 / 2,
//           indexHintDecoration: BoxDecoration(color: AppColors.primaryColor),
//           indexHintAlignment: Alignment.centerRight,
//           indexHintChildAlignment: const Alignment(-0.25, 0.0),
//           indexHintOffset: const Offset(-20, 0),
//         ),
//       ),
//     );
//   }
// }

// class ContactInfo extends ISuspensionBean {
//   String name;
//   String? tagIndex;
//   String? namePinyin;

//   Color? bgColor;
//   IconData? iconData;

//   String? img;
//   String? id;
//   String? firstletter;

//   ContactInfo({
//     required this.name,
//     this.tagIndex,
//     this.namePinyin,
//     this.bgColor,
//     this.iconData,
//     this.img,
//     this.id,
//     this.firstletter,
//   });

//   ContactInfo.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         img = json['img'],
//         id = json['id']?.toString(),
//         firstletter = json['firstletter'];

//   @override
//   String getSuspensionTag() => tagIndex!;

//   @override
//   String toString() => json.encode(this);
// }
