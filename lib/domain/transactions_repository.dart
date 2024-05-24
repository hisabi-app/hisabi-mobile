import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/transaction_model.dart';

abstract class TransactionsRepo {
  Future<dynamic> getTransactions(String token, String query);
}

class AllTransactionsRepo implements TransactionsRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getTransactions(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {\n    transactions(search: \"\" page: 0) {\n        data {\n            id\n            amount\n            created_at\n            note\n            brand {\n                id\n                name\n                category {\n                    name\n                    type\n                    color\n                }\n            }\n        }\n        paginatorInfo {\n            hasMorePages\n        }\n    }\n}"
        },
        options: options,
      );
      final jsonData = response.data["data"]["transactions"]["data"];
      print(jsonData);
      List<TransactionModel> transactions = List<TransactionModel>.from(
          jsonData.map((x) => TransactionModel.fromJson(x)));
      return transactions;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

class FilteredTransactionsRepo implements TransactionsRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getTransactions(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {\n    transactions(search: \"$query\" page: 1) {\n        data {\n            id\n            amount\n            created_at\n            note\n            brand {\n                id\n                name\n                category {\n                    name\n                    type\n                    color\n                }\n            }\n        }\n        paginatorInfo {\n            hasMorePages\n        }\n    }\n}"
        },
        options: options,
      );
      final jsonData = response.data["data"]["transactions"]["data"];
      print(jsonData);
      List<TransactionModel> transactions = List<TransactionModel>.from(
          jsonData.map((x) => TransactionModel.fromJson(x)));
      return transactions;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
