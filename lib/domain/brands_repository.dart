import 'package:dio/dio.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';

abstract class BrandsRepo {
  Future<List<BrandModel>> getBrands(String token, String query);
}

class AllBrandsRepo implements BrandsRepo {
  Dio dio = Dio();

  @override
  Future<List<BrandModel>> getBrands(String token, String query) async {
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

// class FilteredBrandsRepo implements BrandsRepo {
//   Dio dio = Dio();

//   @override
//   Future<String> getBrands(String token, String query) async {
//     String brands = "";
//     try {
//       Options options = Options(headers: {"Authorization": "Bearer $token"});
//       await dio
//           .post(
//             "https://finance-demo.saleem.dev/graphql",
//             data: {
//               "query":
//                   "query { brands(search: \"${query}\", first: 50, page: 1) {    paginatorInfo {      count      currentPage      firstItem      hasMorePages      lastItem      lastPage      perPage      total    }    data {      id      name      category{        id        name        type        color      }      transactionsCount    }  } }"
//             },
//             options: options,
//           )
//           .then((value) => brands = value.toString());
//     } catch (e) {
//       print(e.toString());
//     }
//     print(brands);
//     return brands;
//   }
// }
