import 'package:dio/dio.dart';

abstract class IncomeRepo {
  Future<dynamic> getIncome(String token, String range);
}

class TotalIncomeRepo implements IncomeRepo {
  Dio dio = Dio();

  @override
  Future<String> getIncome(String token, String range) async {
    String income = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {"query": "query{totalIncome(range: \"${range}\")}"},
            options: options,
          )
          .then((value) => income = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(income);
    return income;
  }
}

class TotalIncomeTrendRepo implements IncomeRepo {
  Dio dio = Dio();

  @override
  Future<String> getIncome(String token, String range) async {
    String income = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {"query": "query{totalIncomeTrend(range: \"${range}\")}"},
            options: options,
          )
          .then((value) => income = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(income);
    return income;
  }
}
