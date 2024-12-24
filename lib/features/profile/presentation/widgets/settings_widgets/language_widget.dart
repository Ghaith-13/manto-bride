// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:restart_app/restart_app.dart';

class LanguageWidget extends StatefulWidget {
  bool fromSplash;
  LanguageWidget({super.key, this.fromSplash = false});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final List<String> items = [
    'ar',
    'en',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.fromSplash
                ? "Choose the application language".tr()
                : "Langauges".tr(),
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor),
          ),
        ),
        BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(state.locale.languageCode),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) async {
                  bool confirmed = await showConfirmationDialog(context);
                  if (confirmed) {
                    setState(() {
                      selectedValue = value;
                      context.read<LocaleCubit>().changeLanguage(value!);
                    });
                    Restart.restartApp(
                      notificationTitle: 'Restarting App',
                      notificationBody: '',
                    );
                  }
                },
                buttonStyleData: ButtonStyleData(
                  height: 50.h,
                  width: 75.w,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.blackColor,
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
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(6),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Confirmation'.tr()),
      content: Text('Are you sure you want to change language ?'.tr()),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'.tr(), style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'.tr(), style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
