import 'dart:convert';

import 'package:dio/dio.dart';

main() async {
  final token = "";
  final repo = IncomePerCategoryRepo();

  final result = await repo.getQuery(token, "current-year");
  print(result);
}

abstract class DashboardRepo {
  Future<dynamic> getQuery(String token, range);
  // Future<String> getTotalPerCategoryTrend();
  // Future<String> getTotalPerBrand();
  // Future<String> getTotalPerBrandTrend();
  // Future<String> getNumberOfTransactions();
  // Future<String> getNumberOfTransactionsPerCategory();
  // Future<String> getNumberOfTransactionsPerBrand();
  // Future<String> getHighestValueTransaction();
  // Future<String> getLowestValueTransaction();
  // Future<String> getAverageValueTransaction();
  // Future<String> getTransactionsStandardDeviation();
  // Future<String> getfinanceVisualizationCirclePackMetric();
}

class IncomePerCategoryRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {incomePerCategory (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["incomePerCategory"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData);
      Map<String, dynamic> jsonMap = {};
      jsonArray.forEach((element) {
        print("${element["label"]} ${element["value"]}");
        jsonMap[element["label"]] = element["value"];
      });

      print(jsonMap);
      return jsonMap;
    } catch (e) {
      print(e.toString());
      return Map();
    }
  }
}

class ExpensesPerCategoryRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {expensesPerCategory (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["expensesPerCategory"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData);
      Map<String, dynamic> jsonMap = {};
      jsonArray.forEach((element) {
        print("${element["label"]} ${element["value"]}");
        jsonMap[element["label"]] = element["value"];
      });

      print(jsonMap);
      return jsonMap;
    } catch (e) {
      print(e.toString());
      return Map();
    }
  }
}

class TotalExpensesTrendRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalExpensesTrend (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalExpensesTrend"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData);
      Map<String, dynamic> jsonMap = {};
      jsonArray.forEach((element) {
        print("${element["label"]} ${element["value"]}");
        jsonMap[element["label"]] = element["value"];
      });

      print(jsonMap);
      return jsonMap;
    } catch (e) {
      print(e.toString());
      return Map();
    }
  }
}

class TotalIncomeTrendRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalIncomeTrend (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalIncomeTrend"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData);
      Map<String, dynamic> jsonMap = {};
      jsonArray.forEach((element) {
        print("${element["label"]} ${element["value"]}");
        jsonMap[element["label"]] = element["value"];
      });

      print(jsonMap);
      return jsonMap;
    } catch (e) {
      print(e.toString());
      return Map();
    }
  }
}

class TotalIncomeRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalIncome (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalIncome"];
      print(jsonData);
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Extract the value
      double value = double.parse(jsonMap["value"].toString());
      double previous = double.parse(jsonMap["previous"].toString());
      // Print the value
      print(value);
      print(previous);
      return [value, previous];
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}

class TotalExpensesRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalExpenses (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalExpenses"];
      print(jsonData);
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Extract the value
      double value = double.parse(jsonMap["value"].toString());
      double previous = double.parse(jsonMap["previous"].toString());
      // Print the value
      print(value);
      print(previous);
      return [value, previous];
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}

class TotalInvestmentRepo implements DashboardRepo {
  Dio dio = Dio();

  @override
  Future<double> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalInvestment}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalInvestment"];
      print(jsonData);
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Extract the value
      double value = double.parse(jsonMap["value"].toString());

      // Print the value
      print(value);
      return value;
    } catch (e) {
      print(e.toString());
      return 0; // Return an empty list in case of failure
    }
  }
}

class TotalCashRepo implements DashboardRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalCash}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalCash"];
      print(jsonData);
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Extract the value
      double value = jsonMap["value"];

      // Print the value
      print(value);
      return value;
    } catch (e) {
      print(e.toString());
      return 0; // Return an empty list in case of failure
    }
  }
}

class TotalSavingsRepo implements DashboardRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalSavings}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalSavings"];
      print(jsonData);
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Extract the value
      double value = double.parse(jsonMap["value"].toString());

      // Print the value
      print(value);
      return value;
    } catch (e) {
      print(e.toString());
      return 0; // Return an empty list in case of failure
    }
  }
}

class NetWorthRepo implements DashboardRepo {
  Dio dio = Dio();

  @override
  Future<double> getQuery(String token, range) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {netWorth}"},
        options: options,
      );
      final jsonData = response.data["data"]["netWorth"];
      print(jsonData);
      final netWorthText = jsonData;
      // Parse the JSON string
      Map<String, dynamic> jsonMap = json.decode(netWorthText);

      // Extract the value
      double value = jsonMap['value'];

      // Print the value
      print(value);
      return value;
    } catch (e) {
      print(e.toString());
      return 0; // Return an empty list in case of failure
    }
  }
}
