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

  Future<dynamic> checkIfLoggedIn() async {
    // Check if the user is logged in by checking the token or the login state
    final token = await _storage.read(key: 'token');
    final email = await _storage.read(key: "email");
    final password = await _storage.read(key: "password");
    final remember = await _storage.read(key: "remember");
    print("$token $email $remember $password inside repo");

    if (token != null &&
        token.isNotEmpty &&
        email!.isNotEmpty &&
        email != null &&
        remember!.isNotEmpty &&
        remember != null &&
        password!.isNotEmpty &&
        password != null) {
      print(true);
      return [email, password];
    } else {
      print(false);
      return false;
    }
  }

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
      await _storage.write(key: "token", value: loginToken);
      if (remember) {
        print("repo remember $remember $email $password");
        await _storage.write(key: "email", value: email);
        await _storage.write(key: "password", value: password);
        await _storage.write(key: "remember", value: remember.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    print(loginToken);
    return loginToken;
  }

  Future<void> logout() async {
    // Clear stored credentials on logout
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
    await _storage.delete(key: 'token');
    await _storage.write(key: 'remember', value: false.toString());
  }
}
