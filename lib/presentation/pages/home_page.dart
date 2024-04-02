import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final navigationBarItems = const [
    BottomNavigationBarItem(label: "Dashbord", icon: Icon(Icons.dashboard)),
    BottomNavigationBarItem(
        label: "Transactions  ", icon: Icon(Icons.transfer_within_a_station)),
    BottomNavigationBarItem(
        label: "Brands", icon: Icon(Icons.branding_watermark)),
    BottomNavigationBarItem(label: "Categories", icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: "SMS Parser", icon: Icon(Icons.translate)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: navigationBarItems),
      appBar: AppBar(),
      body: const Text("Home Page"),
    );
  }
}
