import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hisabi_mobile_flutter/features/authentication/data/model/user_model.dart';

class AuthRepository {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://finance-demo.saleem.dev/api/"),
  );
  final _storage = FlutterSecureStorage();

  Future<String> getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return "${androidInfo.manufacturer} ${androidInfo.model}"; // e.g., "Samsung SM-G991B"
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name ?? "iOS Device"; // e.g., "John’s iPhone"
    } else {
      return "Unknown Device";
    }
  }

  Future<String> login(
    String email,
    String password,
    String deviceName,
    bool remember,
  ) async {
    String loginToken = "";
    try {
      await _dio
          .post(
            "login/",
            data: {
              "email": email,
              "password": password,
              "device_name": deviceName,
              "remember": remember,
            },
          )
          .then((value) => loginToken = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(loginToken);
    return loginToken;
  }

  Future<bool> checkIfLoggedIn() async {
    // Check if the user is logged in by checking the token or the login state
    final token = await _storage.read(key: 'access_token');
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    // Clear stored credentials on logout
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'is_logged_in');
    await _storage.delete(key: 'tenant');
  }
}
