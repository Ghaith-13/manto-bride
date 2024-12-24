import 'package:manto_bride/core/extensions/colors_extensions.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/features/home/data/models/product_model.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';

class ColorDropDown extends StatefulWidget {
  final ProductData productData;
  const ColorDropDown({super.key, required this.productData});

  @override
  State<ColorDropDown> createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ColorDropDown> {
  final List<String> colors = [];

  @override
  void initState() {
    super.initState();
    if (widget.productData.product!.colors!.isEmpty) {
      setState(() {
        colors.add("Other");
      });
    }
    if (widget.productData.product!.colors != null) {
      for (int i = 0; i < widget.productData.product!.colors!.length; i++) {
        setState(() {
          colors.add(widget.productData.product!.colors![i].colorHex ?? "");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${'Colors'.tr()} : ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor),
                  ),
                  5.pw,
                  state.selectedColor.isEmpty
                      ? SizedBox()
                      : state.selectedColor == "Other"
                          ? Text(
                              state.selectedColor,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor),
                            )
                          : Container(
                              width: 25,
                              height: 25,
                              margin: EdgeInsetsDirectional.only(end: 10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(10),
                                color: state.selectedColor == "Other"
                                    ? Colors.transparent
                                    : HexColor.fromHex(state.selectedColor),
                              ),
                            ),
                ],
              ),
              5.ph,
              SizedBox(
                width: 1.sw,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<HomeCubit>()
                            .changeColorSelected(colors[index]);
                      },
                      child: Container(
                          width: colors[index] == "Other" ? null : 50,
                          height: 50,
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(10),
                            color: state.selectedColor == "Other"
                                ? Colors.black
                                : colors[index] == "Other"
                                    ? Colors.white
                                    : HexColor.fromHex(colors[index]),
                            border: Border.all(
                              color: colors[index] == "Other"
                                  ? Colors.black
                                  : state.selectedColor == colors[index]
                                      ? HexColor.fromHex(colors[index]) ==
                                              Colors.black
                                          ? Colors.white
                                          : Colors.black
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: colors[index] == "Other"
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    "Other".tr(),
                                    style: TextStyle(
                                        color: state.selectedColor == "Other"
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )),
                                )
                              : SizedBox()),
                    );
                  },
                ),
              ),
            ],
          ),
        );

        // DropdownButtonHideUnderline(
        //   child: DropdownButton2<String>(
        //     isExpanded: true,
        //     hint: Row(
        //       children: [
        //         Expanded(
        //           child: state.selectedColor.isEmpty
        //               ? Text(
        //                   'Colors'.tr(),
        //                   style: const TextStyle(
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.bold,
        //                     color: AppColors.blackColor,
        //                   ),
        //                   overflow: TextOverflow.ellipsis,
        //                 )
        //               : state.selectedColor == "Other"
        //                   ? Text(
        //                       "Other".tr(),
        //                       style: const TextStyle(
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.bold,
        //                         color: AppColors.blackColor,
        //                       ),
        //                       overflow: TextOverflow.ellipsis,
        //                     )
        //                   : CircleAvatar(
        //                       backgroundColor:
        //                           HexColor.fromHex(state.selectedColor),
        //                     ),
        //         ),
        //       ],
        //     ),
        //     items: colors
        //         .map((String item) => DropdownMenuItem<String>(
        //             value: item,
        //             child: item == "Other"
        //                 ? Text(
        //                     "Other".tr(),
        //                     style: TextStyle(
        //                       fontSize: 14.sp,
        //                       fontWeight: FontWeight.w500,
        //                       color: AppColors.blackColor,
        //                     ),
        //                     overflow: TextOverflow.ellipsis,
        //                   )
        //                 : Padding(
        //                     padding: EdgeInsets.symmetric(vertical: 5.h),
        //                     child: Center(
        //                       child: CircleAvatar(
        //                         backgroundColor: HexColor.fromHex(item),
        //                       ),
        //                     ),
        //                   )

        //             // Text(
        //             //   item,
        //             //   style: TextStyle(
        //             //     fontSize: 14.sp,
        //             //     fontWeight: FontWeight.w500,
        //             //     color: AppColors.primaryColor,
        //             //   ),
        //             //   overflow: TextOverflow.ellipsis,
        //             // ),
        //             ))
        //         .toList(),
        //     // value: selectedValue,
        //     onChanged: (value) {
        //       context.read<HomeCubit>().changeColorSelected(value!);
        //       // ScaffoldMessenger.of(context).showSnackBar(
        //       //   SnackBar(
        //       //     backgroundColor: AppColors.primaryColor,
        //       //     padding: EdgeInsets.only(
        //       //         bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
        //       //     content: Text(
        //       //       "Selected Successfully".tr(),
        //       //       style: const TextStyle(color: Colors.white),
        //       //     ),
        //       //     duration: const Duration(seconds: 2),
        //       //   ),
        //       // );
        //     },
        //     buttonStyleData: ButtonStyleData(
        //       height: 40.h,
        //       width: 137.w,
        //       padding: const EdgeInsets.only(left: 14, right: 14),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(14),
        //         border: Border.all(
        //           color: Colors.black26,
        //         ),
        //         color: Colors.white,
        //       ),
        //       elevation: 2,
        //     ),
        //     iconStyleData: IconStyleData(
        //       icon: Icon(
        //         Icons.keyboard_arrow_down_rounded,
        //         size: 16.sp,
        //       ),
        //       iconSize: 14,
        //       iconEnabledColor: Colors.black,
        //       iconDisabledColor: Colors.grey,
        //     ),
        //     dropdownStyleData: DropdownStyleData(
        //       maxHeight: 200,
        //       width: 200,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(14),
        //         color: Colors.white,
        //       ),
        //       offset: const Offset(-20, 0),
        //       scrollbarTheme: ScrollbarThemeData(
        //         radius: const Radius.circular(40),
        //         thickness: WidgetStateProperty.all(6),
        //         thumbVisibility: WidgetStateProperty.all(true),
        //       ),
        //     ),
        //     menuItemStyleData: const MenuItemStyleData(
        //       // height: 40,
        //       padding: EdgeInsets.only(left: 14, right: 14),
        //     ),
        //   ),
        // );
      },
    );
  }
}
