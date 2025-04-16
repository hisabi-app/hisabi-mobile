import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardChartCard extends StatelessWidget {
  final String title;
  final double value;
  final List<Map<String, dynamic>> chartData;

  const DashboardChartCard({
    required this.title,
    required this.value,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
      height: height * 0.3,
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[700])),
          Expanded(
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots:
                        chartData
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                                entry.key.toDouble(), // X as index
                                (entry.value["value"] as num).toDouble(), // Y
                              ),
                            )
                            .toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          ),
          Text("AED ${value.round() / 1000}k", style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
