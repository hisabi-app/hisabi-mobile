import 'package:dio/dio.dart';

abstract class CategoriesRepo {
  Future<dynamic> getCategories(String token, String query);
}

class AllCategoriesRepo implements CategoriesRepo {
  Dio dio = Dio();

  @override
  Future<String> getCategories(String token, String query) async {
    String categories = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {
              "query": "query {  allCategories {  id  name  type  color}}"
            },
            options: options,
          )
          .then((value) => categories = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(categories);
    return categories;
  }
}

class FilteredCategoriesRepo implements CategoriesRepo {
  Dio dio = Dio();

  @override
  Future<String> getCategories(String token, String query) async {
    String categories = "";
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      await dio
          .post(
            "https://finance-demo.saleem.dev/graphql",
            data: {
              "query":
                  "query { categories(search: \"${query}\", first: 50, page: 1) { paginatorInfo { count currentPage firstItem hasMorePages lastItem lastPage perPage total } data { id name type color } } }"
            },
            options: options,
          )
          .then((value) => categories = value.toString());
    } catch (e) {
      print(e.toString());
    }
    print(categories);
    return categories;
  }
}
