import 'package:flutter/material.dart';

class CreateTransactionPopup extends StatefulWidget {
  @override
  State<CreateTransactionPopup> createState() => _CreateTransactionPopupState();
}

class _CreateTransactionPopupState extends State<CreateTransactionPopup> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: height * 0.7,
        width: width * 0.3,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text("Create Transaction"),
            SizedBox(
              height: height * 0.025,
            ),
            Column(
              children: [
                Text("Amount (AED)"),
                Container(
                    padding: EdgeInsets.only(top: 0, bottom: 0),
                    margin: EdgeInsets.only(top: 0, bottom: 0),
                    width: width * 0.2,
                    child: TextFormField(
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
                    width: width * 0.2,
                    child: TextFormField(
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
                    width: width * 0.2,
                    child: TextFormField(
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
                    width: width * 0.2,
                    child: TextFormField(
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
