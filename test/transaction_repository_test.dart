import 'package:flutter_test/flutter_test.dart';
import 'package:cashify_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('AllTransactionsRepo', () {
    test('getTransactions all, with valid token', () async {
      // Arrange
      final repo = AllTransactionsRepo();
      final token = "";

      // Act
      final transactions = await repo.getTransactions(token);

      // Assert
      expect(transactions, isNotEmpty); // Assert that loginToken is not empty
    });

    test('getTransactions all, with invalid token', () async {
      // Arrange
      final repo = AllTransactionsRepo();
      final token = "";

      // Act
      final transactions = await repo.getTransactions(token);

      // Assert
      expect(transactions, isEmpty); // Assert that loginToken is not empty
    });
  });
}
