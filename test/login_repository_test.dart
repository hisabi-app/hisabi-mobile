import 'package:flutter_test/flutter_test.dart';
import 'package:cashify_mobile_flutter/domain/login_repository.dart';

void main() {
  group('LoginWithApiRepo', () {
    test('login', () async {
      // Arrange
      final repo = LoginWithApiRepo();
      final realUserName = "";
      final realPassword = "";

      // Act
      final loginToken = await repo.login(realUserName, realPassword);

      // Assert
      expect(loginToken, isNotEmpty); // Assert that loginToken is not empty
    });

    test('login with invalid credentials', () async {
      // Arrange
      final repo = LoginWithApiRepo();

      // Act
      final loginToken =
          await repo.login("invalid@example.com", "invalidpassword");

      // Assert
      expect(loginToken,
          isEmpty); // Assert that loginToken is empty (since the login failed)
    });
  });
}
