// ignore_for_file: file_names

import '../../../../core/utils/http_helper.dart';

class SignUpDs {
  final ApiBaseHelper apiHelper;

  SignUpDs({required this.apiHelper});

  Future<Map<String, dynamic>?> signUp(Map<String, String>? body) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/auth/register", body: body, headers: {});
    return response;
  }

  Future<Map<String, dynamic>?> logIn(Map<String, String>? body) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/auth/login", body: body, headers: {});
    return response;
  }

  Future<Map<String, dynamic>?> authUsingGoogle(
      Map<String, String>? body) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/auth/google-auth", body: body, headers: {});
    return response;
  }

  Future<Map<String, dynamic>?> resetPassword(Map<String, String>? body) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/auth/reset-password", body: body, headers: {});
    return response;
  }

  Future<Map<String, dynamic>?> checkNumber(String number) async {
    Map<String, dynamic>? response = await apiHelper.get("/auth/check-number",
        queryParameters: {"phone": number}, headers: {});
    return response;
  }
}
