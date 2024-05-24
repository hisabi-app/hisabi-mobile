import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/domain/income_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';

void main() {
  group('TotalIncomeRepo', () {
    test('get totalIncome, for current-month', () async {
      // Arrange
      final repo = TotalIncomeRepo();
      final token = "";
      final range = "current-month";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncome":"{\\"value\\":16000,\\"previous\\":14530}"}}';

      // Assert
      expect(income, result);
    });

    test('get totalIncome, for last-month', () async {
      // Arrange
      final repo = TotalIncomeRepo();
      final token = "";
      final range = "last-month";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncome":"{\\"value\\":14530,\\"previous\\":0}"}}';

      // Assert
      expect(income, result);
    });

    test('get totalIncome, for current-year', () async {
      // Arrange
      final repo = TotalIncomeRepo();
      final token = "";
      final range = "current-year";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncome":"{\\"value\\":53030,\\"previous\\":0}"}}';

      // Assert
      expect(income, result);
    });

    test('get totalIncome, for last-year', () async {
      // Arrange
      final repo = TotalIncomeRepo();
      final token = "";
      final range = "last-year";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncome":"{\\"value\\":0,\\"previous\\":0}"}}';

      // Assert
      expect(income, result);
    });
    test('get totalIncome, for all-time', () async {
      // Arrange
      final repo = TotalIncomeRepo();
      final token = "";
      final range = "all-time";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncome":"{\\"value\\":53030,\\"previous\\":0}"}}';

      // Assert
      expect(income, result);
    });
  });
  group('TotalIncomeTrendRepo', () {
    test('get totalIncomeTrend, for last-twelve-months', () async {
      // Arrange
      final repo = TotalIncomeTrendRepo();
      final token = "";
      final range = "last-twelve-months";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncomeTrend":"[{\\"label\\":\\"2024-02\\",\\"value\\":9000},{\\"label\\":\\"2024-03\\",\\"value\\":13500},{\\"label\\":\\"2024-04\\",\\"value\\":14530},{\\"label\\":\\"2024-05\\",\\"value\\":16000}]"}}';

      // Assert
      expect(income, result);
    });
    test('get totalIncomeTrend, for current-year', () async {
      // Arrange
      final repo = TotalIncomeTrendRepo();
      final token = "";
      final range = "current-year";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncomeTrend":"[{\\"label\\":\\"2024-02\\",\\"value\\":9000},{\\"label\\":\\"2024-03\\",\\"value\\":13500},{\\"label\\":\\"2024-04\\",\\"value\\":14530},{\\"label\\":\\"2024-05\\",\\"value\\":16000}]"}}';

      // Assert
      expect(income, result);
    });
    test('get totalIncomeTrend, for last-year', () async {
      // Arrange
      final repo = TotalIncomeTrendRepo();
      final token = "";
      final range = "last-year";

      // Act
      final income = await repo.getIncome(token, range);
      const result = '{"data":{"totalIncomeTrend":"[]"}}';

      // Assert
      expect(income, result);
    });
    test('get totalIncomeTrend, for all-time', () async {
      // Arrange
      final repo = TotalIncomeTrendRepo();
      final token = "";
      final range = "all-time";

      // Act
      final income = await repo.getIncome(token, range);
      const result =
          '{"data":{"totalIncomeTrend":"[{\\"label\\":\\"2024-02\\",\\"value\\":9000},{\\"label\\":\\"2024-03\\",\\"value\\":13500},{\\"label\\":\\"2024-04\\",\\"value\\":14530},{\\"label\\":\\"2024-05\\",\\"value\\":16000}]"}}';

      // Assert
      expect(income, result);
    });
  });
}
