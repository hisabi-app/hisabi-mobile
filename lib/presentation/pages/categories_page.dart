import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/categories_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class CategoriesPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => CategoriesPage());
  final allCategoriesRepo = AllCategoriesRepo();

  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    final categories = allCategoriesRepo.getCategories(token, "");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
                future: categories,
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
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Container(width: width * 0.1, child: Text("ID")),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Container(
                                width: width * 0.3,
                                child: Text("NAME"),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Container(
                                width: width * 0.2,
                                child: Text("TYPE"),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                            ],
                          ),
                          Container(
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
                                      final category = data![index];
                                      return Center(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                                width: width * 0.1,
                                                child: Text(category.id)),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                              width: width * 0.3,
                                              child: Text(category.name),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                              width: width * 0.2,
                                              child: Text(category.type),
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
                              onPressed: () {}, child: Text("CREATE CATEGORY")),
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
