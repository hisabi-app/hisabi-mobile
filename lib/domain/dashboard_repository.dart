import 'dart:convert';

import 'package:dio/dio.dart';

abstract class DashboardRepo {
  Future<dynamic> getQuery(String token, range, id);
}

class FinanceVisualizationCirclePackMetricRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {financeVisualizationCirclePackMetric (range:\"${range}\")}"
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
}

class AverageValueTransactionRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
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
}

class TransactionsStandardDeviationRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, category_id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {transactionsStandardDeviation (range:\"${range}\", id:${category_id})}"
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
}

class LowestValueTransactionRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
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
}

class HighestValueTransactionRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
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
}

class NumberOfTransactionsPerBrandRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {numberOfTransactionsPerBrand (range:\"${range}\", id:${id})}"
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
}

class NumberOfTransactionsPerCategoryRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {numberOfTransactionsPerCategory (range:\"${range}\")}"
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
}

class TotalPerBrandTrendRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query": "query {totalPerBrandTrend (range:\"${range}\", id:${id})}"
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
}

class NumberOfTransactionsRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
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
}

class TotalPerBrandRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, category_id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {totalPerBrand (range:\"${range}\", category_id:${category_id})}"
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
}

class TotalPerCategoryTrendRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {totalPerCategoryTrend (range:\"${range}\", id:${id})}"
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
}

class IncomePerCategoryRepo implements DashboardRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<double> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<dynamic> getQuery(String token, range, id) async {
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
  Future<double> getQuery(String token, range, id) async {
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
