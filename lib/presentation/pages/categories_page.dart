import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/categories_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final route = MaterialPageRoute(builder: (context) => CategoriesPage());

  final filteredCategoriesRepo = FilteredCategoriesRepo();

  SearchController _searchController = SearchController();
  String? _token;
  Future<dynamic>? _categories;

  @override
  void initState() {
    super.initState();
    _token = "";
    _searchController.addListener(queryListener);
    _categories =
        filteredCategoriesRepo.getCategories(_token!, _searchController.text);
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
      _categories =
          filteredCategoriesRepo.getCategories(_token!, _searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    setState(() {
      _token = token;
      _categories =
          filteredCategoriesRepo.getCategories(_token!, _searchController.text);
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
                    future: _categories,
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
                                height: height * 0.2,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          final data = snapshot.data;
                                          final category = data![index];
                                          return Center(
                                            child: Container(
                                              width: width * 0.7,
                                              height: height * 0.2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey[100]),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: width * 0.33,
                                                        height: height * 0.03,
                                                      ),
                                                      Container(
                                                        height: height * 0.03,
                                                        child: Text(
                                                          category.id,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: height * 0.035,
                                                    child: Text(
                                                      category.name
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: width * 0.335,
                                                      ),
                                                      Container(
                                                        height: height * 0.03,
                                                        child: Text(
                                                          category.type,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12),
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
                                  child: const Text("CREATE CATEGORY")),
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
