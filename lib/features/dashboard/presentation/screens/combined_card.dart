import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardCombinedChart extends StatelessWidget {
  final List<Map<String, dynamic>> incomeData;
  final List<Map<String, dynamic>> expenseData;
  final double height;

  const DashboardCombinedChart({
    super.key,
    required this.incomeData,
    required this.expenseData,
    this.height = 200,
  });

  List<FlSpot> generateSpots(List<Map<String, dynamic>> data) {
    return data.asMap().entries.map((entry) {
      int index = entry.key;
      double y = (entry.value["value"] as num).toDouble();
      return FlSpot(index.toDouble(), y);
    }).toList();
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final incomeSpots = generateSpots(incomeData);
    final expenseSpots = generateSpots(expenseData);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 4),
          child: Row(
            children: [
              _buildLegend(Colors.green, "Income"),
              const SizedBox(width: 16),
              _buildLegend(Colors.red, "Expenses"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: incomeSpots,
                  isCurved: true,
                  barWidth: 2,
                  color: Colors.green,
                ),
                LineChartBarData(
                  spots: expenseSpots,
                  isCurved: true,
                  barWidth: 2,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
