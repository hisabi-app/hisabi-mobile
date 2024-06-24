import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/domain/categories_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';

class CreateBrandPopup extends StatefulWidget {
  final VoidCallback onBrandCreated;

  CreateBrandPopup({required this.onBrandCreated});

  @override
  State<CreateBrandPopup> createState() => _CreateBrandPopupState();
}

class _CreateBrandPopupState extends State<CreateBrandPopup> {
  String? selectedCategory;
  final brandNameController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final token = context.read<AppCubit>().state.token;
    final createBrandRepo = CreateBrandRepo();
    final allCategoriesRepo = AllCategoriesRepo();

    return Dialog(
      child: Container(
        height: height * 0.7,
        width: width * 0.3,
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Text("Create Brand",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: height * 0.025),
            Column(
              children: [
                Text("Name"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: TextFormField(
                    onChanged: (value) {
                      brandNameController.text = value;
                    },
                    controller: brandNameController,
                    cursorHeight: height * 0.025,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Text("Category"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: FutureBuilder(
                    future: allCategoriesRepo.getCategories(token, ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No categoriess available');
                      }

                      final List<DropdownMenuItem<String>> items = snapshot
                          .data!
                          .map<DropdownMenuItem<String>>((category) {
                        return DropdownMenuItem<String>(
                          value: category.id.toString(),
                          child: Text(category.name),
                        );
                      }).toList();

                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DropdownButton<String>(
                              value: selectedCategory,
                              items: items,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                              hint: Text('Select a category'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            TextButton(
              onPressed: () async {
                createBrandRepo.createOrUpdateBrand(
                  token,
                  brandNameController.text,
                  int.parse(selectedCategory ?? '0'),
                );
                var oldState = context.read<AppCubit>().state;
                context
                    .read<AppCubit>()
                    .updateState(oldState.copyWith(newSubmission: true));
                widget.onBrandCreated();
                Navigator.pop(context);
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
