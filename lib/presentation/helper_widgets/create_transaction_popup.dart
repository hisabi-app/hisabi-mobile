import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';

class CreateTransactionPopup extends StatefulWidget {
  @override
  State<CreateTransactionPopup> createState() => _CreateTransactionPopupState();
}

class _CreateTransactionPopupState extends State<CreateTransactionPopup> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final amountController = TextEditingController();
    final dateController = TextEditingController();
    final brandController = TextEditingController();
    final noteController = TextEditingController();
    final token = context.read<AppCubit>().state.token;

    return Dialog(
      child: Container(
        height: height * 0.7,
        width: width * 0.3,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Create Transaction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.025,
            ),
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
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
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
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Column(
              children: [
                Text("Brand"),
                Container(
                    padding: EdgeInsets.only(top: 0, bottom: 0),
                    margin: EdgeInsets.only(top: 0, bottom: 0),
                    width: width * 0.5,
                    child: TextFormField(
                      onChanged: (value) {
                        brandController.text = value;
                      },
                      controller: brandController,
                      cursorHeight: height * 0.025,
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
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
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextButton(onPressed: () {}, child: Text("Create"))
          ],
        ),
      ),
    );
  }
}
