import 'package:dio/dio.dart';

abstract class TransactionsRepo {
  Future<dynamic> getTransactions(String token);
}

class AllTransactionsRepo implements TransactionsRepo {
  Dio dio = Dio();

  @override
  Future<String> getTransactions(String token) async {
    String transactions = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {
              "query":
                  "query {\n    transactions(search: \"\" page: 0) {\n        data {\n            id\n            amount\n            created_at\n            note\n            brand {\n                id\n                name\n                category {\n                    name\n                    type\n                    color\n                }\n            }\n        }\n        paginatorInfo {\n            hasMorePages\n        }\n    }\n}"
            },
            options: options,
          )
          .then((value) => transactions = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(transactions);
    return transactions;
  }
}
