import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class BrandsPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => BrandsPage());
  final allBrandsRepo = AllBrandsRepo();
  // final filteredBrandsRepo = FilteredBrandsRepo();
  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    final brands = allBrandsRepo.getBrands(token, "");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
                future: brands,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.3),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Row(children: [
                            SizedBox(
                              width: width * 0.1,
                            ),
                            SearchBar(
                              leading: const Icon(Icons.search),
                              constraints: BoxConstraints(
                                maxWidth: width * 0.8,
                                minHeight: height * 0.05,
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.05),
                            height: height * 0.45,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      final data = snapshot.data;
                                      final brand = data![index];
                                      return Center(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                                width: width * 0.1,
                                                child: Text(
                                                    brand.brandId.toString())),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                              width: width * 0.3,
                                              child: Text(
                                                brand.brandName,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                              width: width * 0.2,
                                              child:
                                                  Text(brand.category["name"]),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text("CREATE BRAND")),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
