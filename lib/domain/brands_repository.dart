import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';

abstract class BrandsQueryRepo {
  Future<dynamic> getBrands(String token, String query);
}

abstract class BrandsMutationRepo {
  Future<dynamic> createOrUpdateBrand(
      String token, String brandName, int categoryId);
}

class CreateBrandRepo implements BrandsMutationRepo {
  Dio dio = Dio();

  Future<dynamic> createOrUpdateBrand(
      String token, String brandName, int categoryId) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "mutation {  createBrand(name:\"$brandName\", category_id: $categoryId) {    id    name    category {      id      name    }    transactionsCount  }  }"
        },
        options: options,
      );
      final jsonData = response.data["data"]["createBrand"];
      print(jsonData);
      BrandModel brand = jsonData.map((x) => BrandModel.fromJson(x));
      return brand;
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of failure
    }
  }
}

class AllBrandsRepo implements BrandsQueryRepo {
  Dio dio = Dio();

  @override
  Future<dynamic> getBrands(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {allBrands {  id    name    category {      id      name      type      color    }  transactionsCount } }"
        },
        options: options,
      );
      final jsonData = response.data["data"]["allBrands"];
      print(jsonData);
      List<BrandModel> brands =
          List<BrandModel>.from(jsonData.map((x) => BrandModel.fromJson(x)));
      return brands;
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of failure
    }
  }
}

class FilteredBrandsRepo implements BrandsQueryRepo {
  Dio dio = Dio();

  @override
  Future<List<BrandModel>> getBrands(String token, String query) async {
    try {
      Options options = Options(headers: {"Authorization": "Bearer $token"});
      final response = await dio.post(
        "https://finance-demo.saleem.dev/graphql",
        data: {
          "query":
              "query {  brands (search:\"${query}\", first: 10000, page: 1){    data {      id,      name,      category {        name,        id,     }      transactionsCount    }    paginatorInfo {      count,      total,          }  } }"
        },
        options: options,
      );
      final jsonData = response.data["data"]["brands"]["data"];
      print(jsonData);
      List<BrandModel> brands =
          List<BrandModel>.from(jsonData.map((x) => BrandModel.fromJson(x)));
      return brands;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
