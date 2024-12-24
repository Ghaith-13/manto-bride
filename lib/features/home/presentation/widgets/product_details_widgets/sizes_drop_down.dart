import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/features/home/data/models/product_model.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';

class SizesDropDown extends StatefulWidget {
  final ProductData productdata;
  const SizesDropDown({super.key, required this.productdata});

  @override
  State<SizesDropDown> createState() => _SizesDropDownState();
}

class _SizesDropDownState extends State<SizesDropDown> {
  final List<String> items = [];
  @override
  void initState() {
    super.initState();
    if (widget.productdata.product!.sizes!.isEmpty) {
      setState(() {
        items.add("Other");
      });
    }

    if (widget.productdata.product!.sizes != null) {
      for (int i = 0; i < widget.productdata.product!.sizes!.length; i++) {
        setState(() {
          items.add(widget.productdata.product!.sizes![i].name ?? "");
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
              Text(
                "${'Sizes'.tr()} : ${state.selectedSize}",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor),
              ),
              5.ph,
              SizedBox(
                width: 1.sw,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //       context.read<HomeCubit>().changeSelectedSize(value!);

                        context
                            .read<HomeCubit>()
                            .changeSelectedSize(items[index]);
                      },
                      child: Container(
                          // height: 30,
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            color: state.selectedSize == items[index]
                                ? Colors.black
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              items[index] == "Other"
                                  ? "Other".tr()
                                  : "${items[index]}",
                              style: TextStyle(
                                  color: state.selectedSize == items[index]
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            )),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        );
        //  DropdownButtonHideUnderline(
        //   child: DropdownButton2<String>(
        //     isExpanded: true,
        //     hint: Row(
        //       children: [
        //         Expanded(
        //           child: Text(
        //             state.selectedSize.isEmpty
        //                 ? 'Sizes'.tr()
        //                 : state.selectedSize == "Other"
        //                     ? "Other".tr()
        //                     : state.selectedSize,
        //             style: const TextStyle(
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //               color: AppColors.blackColor,
        //             ),
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ),
        //       ],
        //     ),
        //     items: items
        //         .map((String item) => DropdownMenuItem<String>(
        //               value: item,
        //               child: Text(
        //                 item == "Other" ? "Other".tr() : item,
        //                 style: TextStyle(
        //                   fontSize: 14.sp,
        //                   fontWeight: FontWeight.w500,
        //                   color: AppColors.blackColor,
        //                 ),
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ))
        //         .toList(),
        //     // value: selectedValue,
        //     onChanged: (value) {
        //       context.read<HomeCubit>().changeSelectedSize(value!);
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
        //       iconEnabledColor: AppColors.blackColor,
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
