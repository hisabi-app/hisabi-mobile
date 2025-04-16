import 'package:flutter/material.dart';

class OverviewItemCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;
  final double height;
  final double width;
  final double fontSize;

  const OverviewItemCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    this.height = 40,
    this.width = 40,
    this.fontSize = 12,
  });

  String formatCompactK(num value) {
    final kValue = value / 1000;
    final str = kValue.toStringAsFixed(1).replaceAll('.', ',');
    return "${str}K";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: color,
              fontSize: fontSize - 3,
            ),
          ),
          Text(
            value == 0 ? "0" : "${(value.round() / 1000)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: value == 0 ? fontSize + 6 : fontSize + 6,
            ),
          ),
        ],
      ),
    );
  }
}
