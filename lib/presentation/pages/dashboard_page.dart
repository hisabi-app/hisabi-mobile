import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => DashboardPage());

    return const Center(
      child: Text("Dashboard"),
    );
  }
}
