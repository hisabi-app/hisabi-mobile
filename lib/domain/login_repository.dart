abstract class LoginRepo {
  Future<bool> login(String username, String password);
}

class LoginWithApiRepo implements LoginRepo {
  @override
  Future<bool> login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
