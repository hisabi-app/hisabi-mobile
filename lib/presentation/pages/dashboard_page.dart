import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => DashboardPage());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Account Overview",
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                    height: height * 0.2,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Net Worth",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          "AED 37.119k",
                          style: TextStyle(fontSize: 50),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                    height: height * 0.2,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Cash",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          "AED 37.119k",
                          style: TextStyle(fontSize: 50),
                        )
                      ],
                    ),
                  ),
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
