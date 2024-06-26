import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/domain/categories_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('AllCategoriesRepo', () {
    test('getCategories all, with valid token', () async {
      // Arrange
      final repo = AllCategoriesRepo();
      final token = "";

      // Act
      final categories = await repo.getCategories(token, "");

      // Assert
      expect(categories, isNotEmpty);
    });

    test('getCategories all, with invalid token', () async {
      // Arrange
      final repo = AllCategoriesRepo();
      final token = "";

      // Act
      final categories = await repo.getCategories(token, "");

      // Assert
      expect(categories, isEmpty);
    });
  });
  group('FilteredTransactionsRepo', () {
    test(
        'getCategories all, with a correct query for an existing transaction,'
        'by name for instance', () async {
      // Arrange
      final repo = FilteredCategoriesRepo();
      final token = "";
      final query = "income";

      // Act
      final categories = await repo.getCategories(token, query);

      // Assert
      expect(
          categories,
          isNot(equals(
              '{"data":{"categories":{"paginatorInfo":{"count":0,"currentPage":1,"firstItem":null,"hasMorePages":false,"lastItem":null,"lastPage":1,"perPage":50,"total":0},"data":[]}}}')));
    });

    test(
        'getCategories all, with an incorrect query for a non existing transaction,'
        ' by brand name for instance', () async {
      // Arrange
      final repo = FilteredCategoriesRepo();
      final token = "";
      final query = "leisure";

      // Act
      final categories = await repo.getCategories(token, query);

      // Assert
      expect(categories,
          '{"data":{"categories":{"paginatorInfo":{"count":0,"currentPage":1,"firstItem":null,"hasMorePages":false,"lastItem":null,"lastPage":1,"perPage":50,"total":0},"data":[]}}}');
    });
  });

  group("CategoryMutation Repo", () {
    test("CreateCategory Repo, with valid params and token", () async {
      //arrange
      final repo = CreateCategoryRepo();
      final token = "";
      final name = "another test category";
      final type = "SHOPPING";
      final color = "Red";

      //act
      final response =
          await repo.createOrUpdateCategory(token, name, type, color);
      Map<String, dynamic> expectedResponse = {
        "id": "7",
        "name": "another test category",
        "type": "SHOPPING",
        "color": "Red"
      };
      //assert
      expect(response, equals(expectedResponse));
    });
  });
}
