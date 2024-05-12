import 'package:flutter_test/flutter_test.dart';
import 'package:hisabi_mobile_flutter/data/models/transaction_model.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('AllTransactionsRepo', () {
    test('getTransactions all, with valid token', () async {
      // Arrange
      final repo = AllTransactionsRepo();
      final token = "31|WbANRrZT1KOhO2qBZzx7XAeXeQIRVGxE6z45FGj914274f1c";

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
  // // group('FilteredTransactionsRepo', () {
  // //   test(
  // //       'getTransactions all, with a correct query for an existing transaction,'
  // //       'by brand name for instance', () async {
  // //     // Arrange
  // //     final repo = FilteredTransactionsRepo();
  // //     final token = "";
  // //     final query = "IKEA";

  // //     // Act
  // //     final transactions = await repo.getTransactions(token, query);

  // //     // Assert
  // //     expect(transactions, isNotEmpty);
  // //   });

  // //   test(
  // //       'getTransactions all, with an incorrect query for a non existing transaction,'
  // //       ' by brand name for instance', () async {
  // //     // Arrange
  // //     final repo = FilteredTransactionsRepo();
  // //     final token = "";
  // //     final query = "nike";

  // //     // Act
  // //     final transactions = await repo.getTransactions(token, query);

  // //     // Assert
  // //     expect(transactions,
  // //         '{"data":{"transactions":{"data":[],"paginatorInfo":{"hasMorePages":false}}}}');
  // //   });
  // });
}
