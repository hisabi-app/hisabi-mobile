import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/brands_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/domain/transactions_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/transactions_page.dart';

class CreateTransactionPopup extends StatefulWidget {
  @override
  State<CreateTransactionPopup> createState() => _CreateTransactionPopupState();
}

class _CreateTransactionPopupState extends State<CreateTransactionPopup> {
  String? selectedBrand;
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final token = context.read<AppCubit>().state.token;
    final createTransactionRepo = CreateTransactionRepo();
    final allBrandsRepo = AllBrandsRepo();

    return Dialog(
      child: Container(
        height: height * 0.7,
        width: width * 0.3,
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Text("Create Transaction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: height * 0.025),
            Column(
              children: [
                Text("Amount (AED)"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: TextFormField(
                    onChanged: (value) {
                      amountController.text = value;
                    },
                    controller: amountController,
                    cursorHeight: height * 0.025,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Text("Date"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: TextFormField(
                    onChanged: (value) {
                      dateController.text = value;
                    },
                    controller: dateController,
                    cursorHeight: height * 0.025,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Text("Brand"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: FutureBuilder(
                    future: allBrandsRepo.getBrands(token, ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                        return Text('No brands available');
                      }

                      final List<DropdownMenuItem<String>> items =
                          snapshot.data.map<DropdownMenuItem<String>>((brand) {
                        return DropdownMenuItem<String>(
                          value: brand.brandId.toString(),
                          child: Text(brand.brandName),
                        );
                      }).toList();

                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DropdownButton<String>(
                              value: selectedBrand,
                              items: items,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedBrand = newValue;
                                });
                              },
                              hint: Text('Select a brand'),
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
                Text("Note"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  width: width * 0.5,
                  child: TextFormField(
                    onChanged: (value) {
                      noteController.text = value;
                    },
                    controller: noteController,
                    cursorHeight: height * 0.025,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            TextButton(
              onPressed: () {
                createTransactionRepo.createOrUpdateTransaction(
                  token,
                  double.parse(amountController.text),
                  int.parse(selectedBrand ?? '0'),
                  dateController.text,
                  noteController.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionsPage()),
                );
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
