import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('AllBrandsRepo', () {
    test('getBrands all, with valid token', () async {
      // Arrange
      final repo = AllBrandsRepo();
      final token = "30|Oid2XwMfiEiiXFukOnMybN7lb0P4UR5mTkpYdOyk42a8f959";

      // Act
      final brands = await repo.getBrands(token, "");

      // Assert
      expect(brands, isNotEmpty);
    });
    test('getBrands all, with valid token', () async {
      // Arrange
      final repo = AllBrandsRepo();
      final token = "30|Oid2XwMfiEiiXFukOnMybN7lb0P4UR5mTkpYdOyk42a8f959";

      // Act
      final brands = await repo.getBrands(token, "");

      // Assert
      expect(brands.runtimeType, List<BrandModel>);
    });

    test('getBrands all, with invalid token', () async {
      // Arrange
      final repo = AllBrandsRepo();
      final token = "";

      // Act
      final brands = await repo.getBrands(token, "");

      // Assert
      expect(brands, isEmpty);
    });
  });
  // // group('FilteredTransactionsRepo', () {
  // //   test(
  // //       'getBrands all, with a correct query for an existing transaction,'
  // //       'by brand name for instance', () async {
  // //     // Arrange
  // //     final repo = FilteredBrandsRepo();
  // //     final token = "";
  // //     final query = "IKEA";

  // //     // Act
  // //     final brands = await repo.getBrands(token, query);

  // //     // Assert
  // //     expect(
  // //         brands,
  // //         isNot(equals(
  // //             '{"data":{"brands":{"paginatorInfo":{"count":0,"currentPage":1,"firstItem":null,"hasMorePages":false,"lastItem":null,"lastPage":1,"perPage":50,"total":0},"data":[]}}}')));
  // //   });

  // //   test(
  // //       'getBrands all, with an incorrect query for a non existing transaction,'
  // //       ' by brand name for instance', () async {
  // //     // Arrange
  // //     final repo = FilteredBrandsRepo();
  // //     final token = "";
  // //     final query = "nike";

  // //     // Act
  // //     final brands = await repo.getBrands(token, query);

  // //     // Assert
  // //     expect(brands,
  // //         '{"data":{"brands":{"paginatorInfo":{"count":0,"currentPage":1,"firstItem":null,"hasMorePages":false,"lastItem":null,"lastPage":1,"perPage":50,"total":0},"data":[]}}}');
  // //   });
  // });
}
