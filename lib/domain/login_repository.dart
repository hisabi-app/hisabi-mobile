import 'package:dio/dio.dart';

abstract class LoginRepo {
  Future<dynamic> login(String username, String password);
}

class LoginWithApiRepo implements LoginRepo {
  Dio dio = Dio();

  @override
  Future<String> login(String username, String password) async {
    String loginToken = "";
    try {
      await dio.post("https://finance-demo.saleem.dev/api/login", data: {
        "email": username,
        "password": password,
        "device_name": "string"
      }).then((value) => loginToken = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(loginToken);
    return loginToken;
  }
}

class LoginWithGoogleRepo implements LoginRepo {
  @override
  Future<bool> login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
