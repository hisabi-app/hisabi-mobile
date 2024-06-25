import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/domain/categories_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';

class CreateCategoryPopup extends StatefulWidget {
  final VoidCallback onCategoryCreated;

  CreateCategoryPopup({required this.onCategoryCreated});

  @override
  State<CreateCategoryPopup> createState() => _CreateCategoryPopupState();
}

class _CreateCategoryPopupState extends State<CreateCategoryPopup> {
  String? selectedType;
  String? selectedColor;
  final categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final token = context.read<AppCubit>().state.token;
    final createCategoryRepo = CreateCategoryRepo();
    final allCategoriesRepo = AllCategoriesRepo();

    return Dialog(
      child: Container(
        height: height * 0.7,
        width: width * 0.3,
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Text("Create Category",
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
                      categoryNameController.text = value;
                    },
                    controller: categoryNameController,
                    cursorHeight: height * 0.025,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Text("Type"),
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

                      final stringItems = snapshot.data!
                          .map<String>((category) {
                            return category.type.toLowerCase().toUpperCase();
                          })
                          .toSet()
                          .toList();

                      final List<DropdownMenuItem<String>> items =
                          stringItems.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem<String>(
                          child: Text(e.toString()),
                          value: e.toString(),
                        );
                      }).toList();

                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DropdownButton<String>(
                              value: selectedType,
                              items: items,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedType = newValue;
                                });
                              },
                              hint: Text('Select a type'),
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
            Column(
              children: [
                Text("Color"),
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

                      final List<DropdownMenuItem<String>> items =
                          snapshot.data!
                              .map<DropdownMenuItem<String>>((category) {
                                return DropdownMenuItem<String>(
                                  value: category.color.toString(),
                                  child: Text(category.color),
                                );
                              })
                              .toSet()
                              .toList();

                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DropdownButton<String>(
                              value: selectedColor,
                              items: items,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedColor = newValue;
                                });
                              },
                              hint: Text('Select a color'),
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
                createCategoryRepo.createOrUpdateCategory(
                  token,
                  categoryNameController.text,
                  selectedType.toString(),
                  selectedColor.toString(),
                );
                var oldState = context.read<AppCubit>().state;
                context
                    .read<AppCubit>()
                    .updateState(oldState.copyWith(newSubmission: true));
                widget.onCategoryCreated();
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
