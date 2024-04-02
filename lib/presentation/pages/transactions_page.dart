import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => TransactionsPage());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Transactions"),
    );
  }
}
