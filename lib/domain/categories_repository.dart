import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';

abstract class CategoriesQueryRepo {
  Future<dynamic> getCategories(String token, String query);
}

abstract class CategoriesMutationRepo {
  Future<dynamic> createorUpdateCategory(
      String token, String name, String type, String color);
}

class CreateCategoryRepo implements CategoriesMutationRepo {
  final dio = Dio();
  @override
  Future<dynamic> createorUpdateCategory(
      String token, String name, String type, String color) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "mutation {  createCategory (name: \"$name\", type: \"$type\", color: \"$color\") {          id,      name,      type,      color      }}"
        },
        options: options,
      );
      final jsonData = response.data["data"]["createCategory"];
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

class AllCategoriesRepo implements CategoriesQueryRepo {
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

class FilteredCategoriesRepo implements CategoriesQueryRepo {
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
