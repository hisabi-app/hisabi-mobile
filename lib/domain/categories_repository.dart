import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';

abstract class CategoriesRepo {
  Future<dynamic> getCategories(String token, String query);
}

class AllCategoriesRepo implements CategoriesRepo {
  Dio dio = Dio();

  @override
  Future<List<CategoryModel>> getCategories(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {"query": "query {  allCategories {  id  name  type  color}}"},
        options: options,
      );

      final jsonData = response.data["data"]["allCategories"];
      List<CategoryModel> categories = List<CategoryModel>.from(
          jsonData.map((x) => CategoryModel.fromJson(x)));
      return categories;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

class FilteredCategoriesRepo implements CategoriesRepo {
  Dio dio = Dio();

  @override
  Future<List<CategoryModel>> getCategories(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query { categories (search: \"${query}\") {    data {      id      name      type color    }    paginatorInfo {      count      total    }  } }"
        },
        options: options,
      );
      final jsonData = response.data["data"]["categories"]["data"];
      print(jsonData);
      List<CategoryModel> categories = List<CategoryModel>.from(
          jsonData.map((x) => CategoryModel.fromJson(x)));
      return categories;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
