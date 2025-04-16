import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashboardRepo {
  Dio dio = Dio();
  FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<dynamic> getFinanceVisualization(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {financeVisualizationCirclePackMetric (range:\"${range}\")}",
        },
        options: options,
      );
      final jsonData =
          response.data["data"]["financeVisualizationCirclePackMetric"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData)["children"];
      Map<String, dynamic> jsonMap = {};
      print("seprator");
      jsonArray.forEach((element) {
        print("${element["label"]} ${element["children"]}");
        jsonMap[element["label"]] = element["children"];
      });

      print(jsonMap);
      return jsonMap;
    } catch (e) {
      print(e.toString());
      return Map();
    }
  }

  Future<dynamic> getAvgValueTrn(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {averageValueTransaction (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["averageValueTransaction"];
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

  Future<dynamic> getTrnStd(range, category_id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {transactionsStandardDeviation (range:\"${range}\", id:${category_id})}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["transactionsStandardDeviation"];
      print(jsonData);
      // Parse the JSON string
      List<dynamic> jsonArray = json.decode(jsonData);
      Map<dynamic, dynamic> jsonMap = {};
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

  Future<dynamic> getLowestValueTransaction(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {lowestValueTransaction (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["lowestValueTransaction"];
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

  Future<dynamic> getHighestValueTransaction(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {highestValueTransaction (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["highestValueTransaction"];
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

  Future<dynamic> getNoOfTransactionsPerBrand(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {numberOfTransactionsPerBrand (range:\"${range}\", id:${id})}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["numberOfTransactionsPerBrand"];
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

  Future<dynamic> getNoOfTrnPerCategory(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {numberOfTransactionsPerCategory (range:\"${range}\")}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["numberOfTransactionsPerCategory"];
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

  Future<dynamic> getTotalPerBrandTrend(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query": "query {totalPerBrandTrend (range:\"${range}\", id:${id})}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["totalPerBrandTrend"];
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

  Future<dynamic> getNoOfTrn(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {numberOfTransactions (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["numberOfTransactions"];
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

  Future<dynamic> getTotalPerBrand(range, category_id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {totalPerBrand (range:\"${range}\", category_id:${category_id})}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["totalPerBrand"];
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

  Future<dynamic> getQueryTotalPerCategoryTrend(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {totalPerCategoryTrend (range:\"${range}\", id:${id})}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["totalPerCategoryTrend"];
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

  Future<dynamic> getIncomePerCategory(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<dynamic> getExpensesPerCategory(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  // Future<dynamic> getTotalExpensesTrend(range, id) async {
  //   final String? token = await secureStorage.read(key: 'token');
  //   try {
  //     Options options = Options(headers: {"Authorization": "Bearer $token"});
  //     final response = await dio.post(
  //       "https://finance-demo.saleem.dev/graphql",
  //       data: {"query": "query {totalExpensesTrend (range:\"${range}\")}"},
  //       options: options,
  //     );
  //     final jsonData = response.data["data"]["totalExpensesTrend"];
  //     print(jsonData);
  //     // Parse the JSON string
  //     List<dynamic> jsonArray = json.decode(jsonData);
  //     Map<String, dynamic> jsonMap = {};
  //     jsonArray.forEach((element) {
  //       print("${element["label"]} ${element["value"]}");
  //       jsonMap[element["label"]] = element["value"];
  //     });

  //     print(jsonMap);
  //     return jsonMap;
  //   } catch (e) {
  //     print(e.toString());
  //     return Map();
  //   }
  // }

  Future<List<Map<String, dynamic>>> getTotalExpensesTrend(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalExpensesTrend (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalExpensesTrend"];
      print(jsonData);

      // Parse the JSON string into a List of Maps
      List<dynamic> jsonArray = json.decode(
        jsonData,
      ); // decoding the string into a List
      List<Map<String, dynamic>> chartData = [];
      jsonArray.forEach((element) {
        chartData.add({"label": element["label"], "value": element["value"]});
      });

      return chartData;
    } catch (e) {
      throw Exception('Failed to load total Expenses trend: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getTotalIncomeTrend(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {totalIncomeTrend (range:\"${range}\")}"},
        options: options,
      );
      final jsonData = response.data["data"]["totalIncomeTrend"];
      print(jsonData);

      // Parse the JSON string into a List of Maps
      List<dynamic> jsonArray = json.decode(
        jsonData,
      ); // decoding the string into a List
      List<Map<String, dynamic>> chartData = [];
      jsonArray.forEach((element) {
        chartData.add({"label": element["label"], "value": element["value"]});
      });

      return chartData;
    } catch (e) {
      throw Exception('Failed to load total income trend: $e');
    }
  }

  Future<dynamic> getTotalIncome(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<dynamic> getTotalExpenses(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<double> getTotalInvestment(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<dynamic> getTotalCash(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<dynamic> getTotalSavings(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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

  Future<double> getNetWorth(range, id) async {
    final String? token = await secureStorage.read(key: 'token');
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
