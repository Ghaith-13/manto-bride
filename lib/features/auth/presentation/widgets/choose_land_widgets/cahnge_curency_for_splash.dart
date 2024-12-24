import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/features/profile/data/models/courency_model.dart';

class CahngeCurencyForSplash extends StatefulWidget {
  final CurencyData? curencyData;
  final bool fromSplash;
  const CahngeCurencyForSplash(
      {super.key, required this.curencyData, this.fromSplash = false});

  @override
  State<CahngeCurencyForSplash> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<CahngeCurencyForSplash> {
  final List<String> Englisitems = [];
  final List<String> Arabicitems = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.curencyData!.currnecies!.length; i++) {
      setState(() {
        Englisitems.add(
            "${widget.curencyData!.currnecies![i].name!} ${widget.curencyData!.currnecies![i].symbolEn}");
        Arabicitems.add(
            "${widget.curencyData!.currnecies![i].name!} ${widget.curencyData!.currnecies![i].symbolAr}");
      });
    }
  }

  String? CURRENCYName;
  CheckForStore() async {
    setState(() {
      CURRENCYName = CacheHelper.getData(key: "CURRENCY_NAME");
    });
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fromSplash
              ? "Select the display currency".tr()
              : "currencies".tr(),
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor),
        ),
        10.ph,
        BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: CURRENCYName != null
                    ? Text("$CURRENCYName")
                    : state.locale.languageCode == "en"
                        ? Text("${Englisitems[0]}")
                        : Text("${Arabicitems[0]}"),
                items: state.locale.languageCode == "en"
                    ? Englisitems.map((String item) => DropdownMenuItem<String>(
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
                        )).toList()
                    : Arabicitems.map((String item) => DropdownMenuItem<String>(
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
                        )).toList(),
                value: selectedValue,
                onChanged: (value) async {
                  var id;

                  setState(() {
                    selectedValue = value;
                    for (int i = 0; i < Englisitems.length; i++) {
                      if (value!
                          .contains(widget.curencyData!.currnecies![i].name!)) {
                        id = widget.curencyData!.currnecies![i].id;
                      }
                    }
                  });
                  await CacheHelper.saveData(
                      key: "CURRENCY_NAME", value: value);
                  await CacheHelper.saveData(
                      key: "CURRENCY_ID", value: id.toString());
                },
                buttonStyleData: ButtonStyleData(
                  height: 50.h,
                  width: 1.sw,
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
                  width: 1.sw,
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
