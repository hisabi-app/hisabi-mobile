import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => DashboardPage());

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "Account Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Networth",
                  ),
                  Text("Total Cash"),
                  Text("Total Investment"),
                  Text("Total Income"),
                  Text("Total Expenses"),
                  Text("Total Income Trend"),
                  Text("Total Expenses Trend"),
                  Text(
                    "Categories Analytics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Brands Analytics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Facts",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Visualization",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
