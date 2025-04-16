import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final double value;

  const DashboardCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
      height: height * 0.2,
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[700])),
          Text("AED ${value.round() / 1000}k", style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
