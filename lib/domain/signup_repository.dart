abstract class SignupRepository {
  Future<bool> signup(String email, String passowrd);
}

class SignupWithEmail implements SignupRepository {
  @override
  Future<bool> signup(String email, String passowrd) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
