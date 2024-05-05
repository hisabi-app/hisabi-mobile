import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class BrandsPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => BrandsPage());
  final allBrandsRepo = AllBrandsRepo();
  final filteredBrandsRepo = FilteredBrandsRepo();
  @override
  Widget build(BuildContext context) {
    final token = context.read<AppCubit>().state.token;
    final brands = allBrandsRepo.getBrands(token, "");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: FutureBuilder(
          future: brands,
          builder: (context, snapshot) {
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
                    height: height * 0.45,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(index.toString());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  TextButton(onPressed: () {}, child: Text("CREATE BRAND")),
                ],
              ),
            );
          }),
    );
  }
}
