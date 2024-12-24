import 'dart:math';

import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:pin_code_fields/pin_code_fields.dart';

class WhatsappConfirmScreen extends StatefulWidget {
  const WhatsappConfirmScreen({super.key});

  @override
  State<WhatsappConfirmScreen> createState() => _WhatsappConfirmScreenState();
}

class _WhatsappConfirmScreenState extends State<WhatsappConfirmScreen> {
  int? number;
  void generateRandomNumber() async {
    final random = Random();
    setState(() {
      number = 1000 + random.nextInt(9000);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    // context.read<AuthCubit>().changesendWhatsappUnsuccessfully();
  }

  bool sendToWhatsApp = false;
  bool ShowPinCode = false;
  bool showLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        backgroundColor: Colors.white,
        IconColor: AppColors.blackColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(25.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Send confirmation code via WhatsApp".tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  10.verticalSpace,
                  ShowPinCode
                      ? SizedBox()
                      : BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return AppConstant.customElvatedButton(
                                context, "Send", () async {
                              print(state.phone);
                              if (sendToWhatsApp) {
                              } else {
                                setState(() {
                                  sendToWhatsApp = true;
                                });
                                generateRandomNumber();
                                String phoneNumber = state.phone!;
                                if (phoneNumber.startsWith("07")) {
                                  phoneNumber =
                                      phoneNumber.replaceFirst("0", "+964");
                                }
                                var headers = {
                                  'Content-Type':
                                      'application/x-www-form-urlencoded'
                                };
                                print(phoneNumber);
                                var request = http.Request(
                                    'POST',
                                    Uri.parse(
                                        'https://api.ultramsg.com/instance96986/messages/chat'));
                                request.bodyFields = {
                                  'token': 'xyzg078g8vltuj3a',
                                  'to': '$phoneNumber',
                                  'body':
                                      'Your code to activate account in MANTO BRIDE is $number'
                                };
                                request.headers.addAll(headers);

                                http.StreamedResponse response =
                                    await request.send();

                                if (response.statusCode == 200) {
                                  print(await response.stream.bytesToString());
                                  setState(() {
                                    ShowPinCode = true;
                                  });
                                  // context.read<AuthCubit>().SignUp(context);
                                } else {
                                  if (response.reasonPhrase == "Not Found") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        padding: EdgeInsets.only(
                                            bottom: 30.h,
                                            top: 30.h,
                                            left: 50.w,
                                            right: 50.w),
                                        content: Text(
                                          response.reasonPhrase!,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                  print(response.reasonPhrase);
                                }

                                setState(() {
                                  sendToWhatsApp = false;
                                });
                              }
                            },
                                loading: sendToWhatsApp,
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                  50.verticalSpace,
                  showLoader
                      ? CircularProgressIndicator()
                      : ShowPinCode
                          ? Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                appContext: context,
                                length: 4,
                                onChanged: (value) {},
                                onCompleted: (value) {
                                  if (int.parse(value) == number) {
                                    Navigator.pop(context);
                                    context.read<AuthCubit>().SignUp();
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
                                          style: const TextStyle(
                                              color: Colors.white),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                    selectedColor:
                                        const Color.fromARGB(153, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(8.sp)),
                              ),
                            )
                          : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
