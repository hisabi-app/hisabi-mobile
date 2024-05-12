import 'package:flutter/foundation.dart';
import 'package:hisabi_mobile_flutter/data/models/brand_model.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';
import 'package:hisabi_mobile_flutter/data/models/sms_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  const TransactionModel({
    required this.brand,
    required this.date,
    required this.amount,
    required this.id,
  });
  final String id;
  final BrandModel brand;
  final DateTime date;
  final double amount;

  factory TransactionModel.empty() {
    return TransactionModel(
      brand: BrandModel.empty(),
      date: DateTime(0, 0, 0),
      amount: 0.0,
      id: "",
    );
  }

  TransactionModel copyWith({
    String? id,
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

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      brand: BrandModel(
          brandName: json['brand']['name'],
          category: CategoryModel(
              id: "",
              name: json['brand']['category']['name'],
              color: "",
              type: ""),
          brandId: json['brand']['id'],
          transactionsCount: 0),
      date: DateTime.parse(json['created_at']),
      amount: (json['amount'] as num).toDouble(),
      id: json['id'],
    );
  }

  // TransactionModel convertSmsToTranscation(SmsModel smsModel) {
  //   return TransactionModel(
  //     brand: BrandModel(
  //         brandName: smsModel.text,
  //         category: Map(),
  //         brandId: "",
  //         transactionsCount: 0),
  //     date: DateTime.now(),
  //     amount: 0.333333333,
  //     id: 3333333,
  //   );
  // }

  @override
  List<Object?> get props => [id, amount, date, brand];
  // , brand, date, amount
}
