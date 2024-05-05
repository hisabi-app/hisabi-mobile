import 'package:dio/dio.dart';

abstract class BrandsRepo {
  Future<dynamic> getBrands(String token, String query);
}

class AllBrandsRepo implements BrandsRepo {
  Dio dio = Dio();

  @override
  Future<String> getBrands(String token, String query) async {
    String brands = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {
              "query":
                  "query {allBrands {  id    name    category {      id      name      type      color    }  transactionsCount } }"
            },
            options: options,
          )
          .then((value) => brands = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(brands);
    return brands;
  }
}

class FilteredBrandsRepo implements BrandsRepo {
  Dio dio = Dio();

  @override
  Future<String> getBrands(String token, String query) async {
    String brands = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {
              "query":
                  "query { brands(search: \"${query}\", first: 50, page: 1) {    paginatorInfo {      count      currentPage      firstItem      hasMorePages      lastItem      lastPage      perPage      total    }    data {      id      name      category{        id        name        type        color      }      transactionsCount    }  } }"
            },
            options: options,
          )
          .then((value) => brands = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(brands);
    return brands;
  }
}
