import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final navigationBarItems = const [
    BottomNavigationBarItem(label: "Dashbord", icon: Icon(Icons.dashboard)),
    BottomNavigationBarItem(
        label: "Transactions", icon: Icon(Icons.currency_exchange)),
    BottomNavigationBarItem(
        label: "Brands", icon: Icon(Icons.branding_watermark)),
    BottomNavigationBarItem(label: "Categories", icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: "Parser", icon: Icon(Icons.translate)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: (value) {
          print(value);
        },
      ),
      body: Center(child: const Text("Home Page")),
    );
  }
}
