import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/cart/data/models/get_address_model.dart';
import 'package:manto_bride/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';

class ProvinceDropDown extends StatefulWidget {
  const ProvinceDropDown({
    super.key,
  });

  @override
  State<ProvinceDropDown> createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ProvinceDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.province == null
            ? SizedBox()
            : state.province!.isEmpty
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.h,
                        child: DropdownButtonHideUnderline(
                          child: BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, locale) {
                              return DropdownButton2<String>(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.provicesName!.isEmpty
                                            ? 'Provinces'.tr()
                                            : state.provicesName!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: state.province
                                    ?.map((Children item) =>
                                        DropdownMenuItem<String>(
                                          value: item.id.toString(),
                                          child: BlocBuilder<LocaleCubit,
                                              LocaleState>(
                                            builder: (context, locale) {
                                              return Text(
                                                "${locale.locale.languageCode == "en" ? item.nameEn ?? "" : locale.locale.languageCode == "ar" ? item.nameAr ?? "" : item.nameKu ?? ""}",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.primaryColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              );
                                            },
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  context.read<CartCubit>().changeprovicesName(
                                        locale.locale.languageCode == "en"
                                            ? state.province!
                                                    .firstWhere((item) =>
                                                        item.id.toString() ==
                                                        value)
                                                    .nameEn ??
                                                ''
                                            : locale.locale.languageCode == "ar"
                                                ? state.province!
                                                        .firstWhere((item) =>
                                                            item.id
                                                                .toString() ==
                                                            value)
                                                        .nameAr ??
                                                    ''
                                                : state.province!
                                                        .firstWhere((item) =>
                                                            item.id
                                                                .toString() ==
                                                            value)
                                                        .nameKu ??
                                                    '',
                                      );
                                  context.read<CartCubit>().changearea(value!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.primaryColor,
                                      padding: EdgeInsets.only(
                                          bottom: 30.h,
                                          top: 30.h,
                                          left: 50.w,
                                          right: 50.w),
                                      content: Text(
                                        "Selected Successfully".tr(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 40.h,
                                  width: 137.w,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  elevation: 2,
                                ),
                                iconStyleData: IconStyleData(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 16.sp,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: AppColors.primaryColor,
                                  iconDisabledColor: Colors.grey,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(-20, 0),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness: WidgetStateProperty.all(6),
                                    thumbVisibility:
                                        WidgetStateProperty.all(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  // height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}
