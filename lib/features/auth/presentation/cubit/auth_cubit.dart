import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/core/utils/http_helper.dart';
import 'package:manto_bride/features/auth/data/models/check_number_model.dart';
import 'package:manto_bride/features/auth/data/models/google_model.dart';
import 'package:manto_bride/features/auth/data/models/reset_password_model.dart';
import 'package:manto_bride/features/auth/data/models/sign_up_model.dart';
import 'package:manto_bride/features/auth/data/repositories/sign_up_repo.dart';
import 'package:manto_bride/features/auth/presentation/pages/reset_password.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:manto_bride/main.dart';
import 'package:manto_bride/main_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../injection_container.dart' as di;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpRepo signUpRepo;

  AuthCubit({
    required this.signUpRepo,
  }) : super(AuthInitial());
  changeNameValue(String name) => emit(state.copyWith(name: name));
  changePhoneValue(String phone) => emit(state.copyWith(phone: phone));
  changeEmailValue(String email) => emit(state.copyWith(email: email));
  changeLogInMethodValue(String logInmethod) =>
      emit(state.copyWith(logInmethod: logInmethod));
  changePasswordValue(String password) =>
      emit(state.copyWith(password: password));

  Future<void> SignUp() async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['phone'] = state.phone!;
      body['email'] = state.email!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      body['name'] = state.name!;
      SignUpModel? response = await signUpRepo.signUp(body: body);

      await cacheData(response);
      di.sl<ApiBaseHelper>().updateHeader();

      emit(state.copyWith(
          phone: "", password: "", email: "", logInmethod: "", name: ""));
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const mainScreen()),
        (Route route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr()
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr()
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> authUsingGoogle(String name, String email) async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['name'] = name;
      body['email'] = email;
      body['fcm_token'] = token ?? "";
      GoogleModel? response = await signUpRepo.authUsingGoogle(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        await cacheDataUsingGoogle(response);
        di.sl<ApiBaseHelper>().updateHeader();

        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const mainScreen()),
          (Route route) => false,
        );
      }
    } catch (e) {
      emit(state.copyWith(loading: false));

      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr()
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr()
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> logIn() async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['login'] = state.logInmethod!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      SignUpModel? response = await signUpRepo.logIn(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        await cacheData(response);
        di.sl<ApiBaseHelper>().updateHeader();

        emit(state.copyWith(
            phone: "", password: "", email: "", logInmethod: "", name: ""));
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const mainScreen()),
          (Route route) => false,
        );
      }
    } catch (e) {
      emit(state.copyWith(loading: false));

      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr()
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> resetPassword(String phone, String password,
      {bool fromProfile = false}) async {
    emit(state.copyWith(loading: true));
    try {
      Map<String, String> body = {};
      body['phone'] = phone;
      body['password'] = password;
      ResetPasswordModel? response = await signUpRepo.resetPassword(body: body);
      if (fromProfile) {
        Navigator.pop(navigatorKey.currentContext!);
        navigatorKey.currentContext!.read<ProfileCubit>().getuserInfo();
      }
      if (response.data!.message!.contains("Password updated successfully")) {
        Navigator.pop(navigatorKey.currentContext!);
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password updated successfully".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password not updated".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr()
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> cacheData(SignUpModel response) async {
    if (response.data!.token != null) {
      await CacheHelper.saveData(
          key: "USER_TOKEN", value: response.data!.token);
    }
    if (response.data!.user!.email != null) {
      await CacheHelper.saveData(
          key: "EMAIL", value: response.data!.user!.email);
    }
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
    if (response.data!.user!.id != null) {
      await CacheHelper.saveData(
          key: "USER_ID", value: response.data!.user!.id.toString());
    }
  }

  Future<void> cacheDataUsingGoogle(GoogleModel response) async {
    if (response.data!.token != null) {
      await CacheHelper.saveData(
          key: "USER_TOKEN", value: response.data!.token);
    }
    if (response.data!.user!.email != null) {
      await CacheHelper.saveData(
          key: "EMAIL", value: response.data!.user!.email);
    }
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
    if (response.data!.user!.id != null) {
      await CacheHelper.saveData(
          key: "USER_ID", value: response.data!.user!.id.toString());
    }
  }

  Future<void> checkNumber(
    String number,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      CheckNumberModel? response = await signUpRepo.checkNumber(number: number);

      if (response.data!.message!
          .contains("The phone is registered with name")) {
        Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute<void>(
            builder: (context) => ResetPassword(
              phoeNumber: number,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "There is no account for this number.".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr()
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr()
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }
}
