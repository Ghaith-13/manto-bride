// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/http_helper.dart';
import 'package:manto_bride/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/profile/data/models/aricales_model.dart';
import 'package:manto_bride/features/profile/data/models/change_curency_model.dart';
import 'package:manto_bride/features/profile/data/models/courency_model.dart';
import 'package:manto_bride/features/profile/data/models/delete_account_model.dart';
import 'package:manto_bride/features/profile/data/models/feedback_model.dart';
import 'package:manto_bride/features/profile/data/models/orders_model.dart';
import 'package:manto_bride/features/profile/data/models/settings_model.dart';
import 'package:manto_bride/features/profile/data/models/tutorilas_model.dart';
import 'package:manto_bride/features/profile/data/models/wallet_model.dart';
import 'package:manto_bride/features/profile/data/repositories/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_info_model.dart';
import '../../../../injection_container.dart' as di;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({
    required this.profileRepo,
  }) : super(ProfileInitial());
  changefeedback(String value) => emit(state.copyWith(feedback: value));
  changeorderId(String value) => emit(state.copyWith(orderId: value));
  Future<void> getOrders() async {
    emit(state.copyWith(laodingOrders: true));
    try {
      MyOrdersModel response = await profileRepo.getOrders();
      emit(state.copyWith(myOrders: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingOrders: false));
  }

  Future<void> getuserInfo() async {
    try {
      if (state.dontFetchUserData) {
      } else {
        emit(state.copyWith(loaidngProfile: true));
        emit(state.copyWith(dontFetchUserData: true));

        UserModel response = await profileRepo.getuserInfo();
        emit(state.copyWith(userInfo: response.data));
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loaidngProfile: false));
    emit(state.copyWith(dontFetchUserData: false));
  }

  Future<void> getCurrencies() async {
    emit(state.copyWith(laodingCurrencies: true));
    try {
      CourencyModel response = await profileRepo.getCurrencies();
      emit(state.copyWith(curencyData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingCurrencies: false));
  }

  Future<void> ChangeCurrencies(String id) async {
    try {
      navigatorKey.currentContext!.read<HomeCubit>().changeLoadingHome(true);
      ChangeCurencyModel response = await profileRepo.changeCurency(id);
      navigatorKey.currentContext!.read<HomeCubit>().changeLoadingHome(false);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  changerepeateNewPassword(String value) =>
      emit(state.copyWith(repeateNewPassword: value));
  changeNewPassword(String value) => emit(state.copyWith(newPassword: value));
  Future<void> sendFeedback() async {
    try {
      emit(state.copyWith(laodingfeedback: true));
      Map<String, String> body = {};
      body['order_id'] = "${state.orderId}";
      body['message'] = "${state.feedback}";

      FeedbackModel? response = await profileRepo.sendFeedBack(body: body);
      if (response.data!.message == "Feedback added successfully") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Thank you for sharing your review.".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(navigatorKey.currentContext!);
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingfeedback: false));
  }

  Future<void> deleteAccount() async {
    try {
      emit(state.copyWith(laodingfeedback: true));
      Map<String, String> body = {};

      DeleteAccountModel? response =
          await profileRepo.deleteAccount(body: body);
      if (response.data!.message == "Account deleted successfully") {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        di.sl<ApiBaseHelper>().updateHeader();

        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
          (Route route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingfeedback: false));
  }

  Future<void> getArticles() async {
    emit(state.copyWith(loadingArticles: true));
    try {
      ArticlesModel response = await profileRepo.getArticles();
      emit(state.copyWith(articles: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> gettutorials() async {
    emit(state.copyWith(loadingArticles: true));
    try {
      TutorialsModel response = await profileRepo.gettutorials();
      emit(state.copyWith(tutorial: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> getWallet() async {
    emit(state.copyWith(loadingArticles: true));
    try {
      WalletModel response = await profileRepo.getWallet();
      emit(state.copyWith(walletData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> getSettings() async {
    emit(state.copyWith(laodingGetSettings: true));
    try {
      SettingsModel response = await profileRepo.getSettings();
      emit(state.copyWith(settings: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingGetSettings: false));
  }
}
