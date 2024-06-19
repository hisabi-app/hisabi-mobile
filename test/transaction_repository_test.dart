import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hisabi_mobile_flutter/data/models/transaction_model.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('AllTransactionsRepo', () {
    test('getTransactions all, with valid token', () async {
      // Arrange
      final repo = AllTransactionsRepo();
      final token = "";

      // Act
      final transactions = await repo.getTransactions(token, "");
      final bufferList = List.from(transactions.map((x) => x));
      print(bufferList.length);
      // Assert
      expect(transactions, isNotEmpty);
    });

    test('getTransactions all, with invalid token', () async {
      // Arrange
      final repo = AllTransactionsRepo();
      final token = "";

      // Act
      final transactions = await repo.getTransactions(token, "");

      // Assert
      expect(transactions, isEmpty);
    });
  });
  group('FilteredTransactionsRepo', () {
    test('search, with valid token', () async {
      // Arrange
      final repo = FilteredTransactionsRepo();
      final token = "";
      final query = "salary";

      // Act
      final transactions = await repo.getTransactions(token, query);
      final bufferList = List.from(transactions.map((x) => x));
      print(bufferList.length);
      // Assert
      expect(transactions, isNotEmpty);
    });
  });

  group("Transaction Mutation Repo", () {
    test(
        "CreateTransaction Repo, Create Transaction with valid params and token",
        () async {
      // Arrange
      final repo = CreateTransactionRepo();
      final token = "";
      final double amount = 100;
      final brand_id = 3;
      final created_at = "6/19/2024";
      final note = "Enjoy";

      // Act
      final response = await repo.createOrUpdateTransaction(
          token, amount, brand_id, created_at, note);
      var expectedResponse = Map<String, dynamic>();
      expectedResponse = {
        "id": "34",
        "brand": {
          "name": "TODO",
          "id": "3",
          "transactionsCount": 14,
          "category": {"name": "Groceries", "id": "3"}
        },
        "note": "Enjoy",
        "amount": 100
      };

      // Assert
      expect(response, equals(expectedResponse));
    });
  });
}
