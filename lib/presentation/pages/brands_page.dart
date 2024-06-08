import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class BrandsPage extends StatefulWidget {
  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final route = MaterialPageRoute(builder: (context) => BrandsPage());

  final filteredBrandsRepo = FilteredBrandsRepo();

  SearchController _searchController = SearchController();
  String? _token;
  Future<dynamic>? _brands;

  @override
  void initState() {
    super.initState();
    _token = "";
    _searchController.addListener(queryListener);
    _brands = filteredBrandsRepo.getBrands(_token!, _searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.removeListener(queryListener);
    _searchController.dispose();
    super.dispose();
  }

  void queryListener() {
    setState(() {
      _brands = filteredBrandsRepo.getBrands(_token!, _searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    print(token);
    final brands = filteredBrandsRepo.getBrands(token, "");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    setState(() {
      _token = token;
      _brands = filteredBrandsRepo.getBrands(_token!, _searchController.text);
    });
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
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
                    controller: _searchController,
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
                SizedBox(
                  height: height * 0.1,
                ),
                FutureBuilder(
                    future: _brands,
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
                              Container(
                                height: height * 0.45,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          final data = snapshot.data;
                                          final brand = data![index];
                                          return Center(
                                            child: Container(
                                              width: width * 0.7,
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.015),
                                              margin: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.010),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey[100]),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.03,
                                                  ),
                                                  Container(
                                                    width: width * 0.2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${brand.brandName}",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          brand.category.name,
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      22,
                                                                      53,
                                                                      207)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.2,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "Transcations Count",
                                                          style: TextStyle(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0),
                                                        width: width * 0.20,
                                                        child: Text(
                                                          "${brand.transactionsCount}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("CREATE BRAND")),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
