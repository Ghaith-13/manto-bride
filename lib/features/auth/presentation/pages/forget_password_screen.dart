import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manto_bride/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String number = "";
  bool sendRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(context, "", true,
          backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Forget Password".tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34.sp,
                      color: AppColors.blackColor),
                ),
              ],
            ),
            50.verticalSpace,
            Text(
              "Please, enter your email address. You will receive a link to create a new password via email."
                  .tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            30.verticalSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                pickerDialogStyle:
                    PickerDialogStyle(backgroundColor: Colors.white),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter Your PhoneNumer'.tr(),
                  labelStyle: TextStyle(color: AppColors.greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'TR',
                onChanged: (phone) {
                  setState(() {
                    number = "null";
                  });
                  try {
                    if (phone.isValidNumber()) {
                      setState(() {
                        number = phone.completeNumber;
                      });
                      // context
                      //     .read<AuthCubit>()
                      //     .changePhoneValue(phone.completeNumber);
                      // print("Yesss");
                    } else {
                      return;
                    }
                  } catch (e) {
                    print(e);
                  }
                  // Additional validation for specific use cases (optional)
                  // For example, advanced server-side validation

                  // Use the complete phone number for further actions

                  // context
                  //     .read<AuthCubit>()
                  //     .changePhoneValue(phone.completeNumber);
                },
              ),
            ),
            // CustomTextFormFieldWidget(
            //   hint: "Enter Your PhoneNumer",
            //   // textInputType: TextInputType.number,
            //   onChange: (value) {
            //     setState(() {
            //       number = value;
            //     });
            //   },
            // ),
            50.verticalSpace,
            sendRequest
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.loading
                          ? CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : AppConstant.customElvatedButton(context, "Send",
                              () {
                              if (sendRequest) {
                              } else {
                                if (number == "null") {
                                  AppConstant.CustomAlert(context,
                                      "Add correct phone number", true, true);
                                } else {
                                  setState(() {
                                    sendRequest = true;
                                  });
                                  context.read<AuthCubit>().checkNumber(
                                        number,
                                      );
                                  setState(() {
                                    sendRequest = false;
                                  });
                                }
                              }
                            },
                              loading: sendRequest,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold));
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
