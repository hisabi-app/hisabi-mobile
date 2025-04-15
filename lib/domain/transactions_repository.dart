import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/transaction_model.dart';

abstract class TransactionsQueryRepo {
  Future<dynamic> getTransactions(String token, String query);
}

abstract class TransactionsMutationRepo {
  Future<dynamic> createOrUpdateTransaction(
    String token,
    double amount,
    int brand_id,
    String created_at,
    String note,
  );
}

class CreateTransactionRepo implements TransactionsMutationRepo {
  Dio dio = Dio();
  @override
  Future<dynamic> createOrUpdateTransaction(
    String token,
    double amount,
    int brand_id,
    String created_at,
    String note,
  ) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "mutation {createTransaction(amount:$amount, brand_id: $brand_id, created_at: \"$created_at\", note: \"$note\") {  id  brand {    name    id    transactionsCount    category {      name      id    }  }  note  amount}    }",
        },
        options: options,
      );
      final jsonData = response.data["data"]["createTransaction"];
      print(jsonData);
      // TransactionModel transaction =
      //     jsonData.map((x) => TransactionModel.fromJson(x));
      return jsonData;
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of failure
    }
  }
}

class AllTransactionsRepo implements TransactionsQueryRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getTransactions(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {\n    transactions(search: \"\" page: 0) {\n        data {\n            id\n            amount\n            created_at\n            note\n            brand {\n                id\n                name\n                category {\n                    name\n                    type\n                    color\n                }\n            }\n        }\n        paginatorInfo {\n            hasMorePages\n        }\n    }\n}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["transactions"]["data"];
      print(jsonData);
      List<TransactionModel> transactions = List<TransactionModel>.from(
        jsonData.map((x) => TransactionModel.fromJson(x)),
      );
      return transactions;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

class FilteredTransactionsRepo implements TransactionsQueryRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getTransactions(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {\n    transactions(search: \"$query\" page: 1) {\n        data {\n            id\n            amount\n            created_at\n            note\n            brand {\n                id\n                name\n                category {\n                    name\n                    type\n                    color\n                }\n            }\n        }\n        paginatorInfo {\n            hasMorePages\n        }\n    }\n}",
        },
        options: options,
      );
      final jsonData = response.data["data"]["transactions"]["data"];
      print(jsonData);
      List<TransactionModel> transactions = List<TransactionModel>.from(
        jsonData.map((x) => TransactionModel.fromJson(x)),
      );
      return transactions;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
