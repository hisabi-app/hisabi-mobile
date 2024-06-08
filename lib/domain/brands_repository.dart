import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';

abstract class BrandsRepo {
  Future<dynamic> getBrands(String token, String query);
}

class AllBrandsRepo implements BrandsRepo {
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

class FilteredBrandsRepo implements BrandsRepo {
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
