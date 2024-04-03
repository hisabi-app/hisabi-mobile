import 'package:cashify_mobile_flutter/models/brand_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  const TransactionModel({
    required this.brand,
    required this.date,
    required this.amount,
    required this.id,
  });
  final int id;
  final BrandModel brand;
  final DateTime date;
  final double amount;

  factory TransactionModel.empty() {
    return TransactionModel(
      brand: BrandModel.empty(),
      date: DateTime(0, 0, 0),
      amount: 0.0,
      id: 0,
    );
  }

  TransactionModel copyWith({
    int? id,
    BrandModel? brand,
    DateTime? date,
    double? amount,
  }) {
    return TransactionModel(
      brand: brand ?? this.brand,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id, brand, date, amount];
}
