import 'dart:math';

import 'package:flutter/services.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:manto_bride/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPassword extends StatefulWidget {
  final String phoeNumber;
  const ResetPassword({super.key, required this.phoeNumber});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String password = "";
  bool showTextFormField = false;
  @override
  void initState() {
    super.initState();
    sendCodeToWhatsapp();
  }

  int? number;
  void generateRandomNumber() async {
    final random = Random();
    setState(() {
      number = 1000 + random.nextInt(9000);
    });
  }

  Future sendCodeToWhatsapp() async {
    generateRandomNumber();
    String phoneNumber = widget.phoeNumber;
    if (phoneNumber.startsWith("07")) {
      phoneNumber = phoneNumber.replaceFirst("0", "+964");
    }
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    print(phoneNumber);
    var request = http.Request('POST',
        Uri.parse('https://api.ultramsg.com/instance96986/messages/chat'));
    request.bodyFields = {
      'token': 'xyzg078g8vltuj3a',
      'to': '$phoneNumber',
      'body': 'Your code to activate account in MANTO BRIDE is $number'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // context.read<AuthCubit>().SignUp(context);
    } else {
      if (response.reasonPhrase == "Not Found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              response.reasonPhrase!,
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      print(response.reasonPhrase);
    }
  }

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
            showTextFormField
                ? SizedBox()
                : Text(
                    "Please enter the PIN code sent via WhatsApp".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            10.verticalSpace,
            showTextFormField
                ? SizedBox()
                : Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 4,
                      onChanged: (value) {},
                      onCompleted: (value) {
                        if (int.parse(value) == number) {
                          print("Done");
                          setState(() {
                            showTextFormField = true;
                          });
                          // Navigator.pop(context);
                          // context.read<AuthCubit>().SignUp();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.redColor,
                              padding: EdgeInsets.only(
                                  bottom: 20.h,
                                  top: 20.h,
                                  left: 20.w,
                                  right: 20.w),
                              content: Text(
                                'The PIN code does not match the code sent.'
                                    .tr(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      textStyle: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 75.sp,
                          fontWeight: FontWeight.bold),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                          disabledColor: Colors.white,
                          selectedFillColor: Colors.white,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          fieldHeight: 100.h,
                          fieldWidth: 75.w,
                          shape: PinCodeFieldShape.box,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.primaryColor,
                          selectedColor: const Color.fromARGB(153, 0, 0, 0),
                          borderRadius: BorderRadius.circular(8.sp)),
                    ),
                  ),
            showTextFormField
                ? CustomTextFormFieldWidget(
                    hint: "Enter Your New Password",
                    onChange: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  )
                : SizedBox(),
            showTextFormField ? 50.verticalSpace : SizedBox(),
            showTextFormField
                ? BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.loading
                          ? CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : AppConstant.customElvatedButton(context, "Send",
                              () {
                              if (password.length < 8) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.only(
                                        bottom: 30.h,
                                        top: 30.h,
                                        left: 50.w,
                                        right: 50.w),
                                    content: Text(
                                      "Password not updated".tr(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                context.read<AuthCubit>().resetPassword(
                                      widget.phoeNumber,
                                      password,
                                    );
                              }
                            },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold));
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
