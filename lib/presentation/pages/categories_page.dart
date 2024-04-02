import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => CategoriesPage());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Categories"),
    );
  }
}
