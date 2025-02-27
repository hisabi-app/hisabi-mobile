import 'package:equatable/equatable.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';

class BankContactModel extends Equatable {
  BankContactModel({
    required this.bankName,
    required this.phoneNumber,
  });

  final String bankName;
  final String phoneNumber;

  factory BankContactModel.empty() {
    return BankContactModel(
      bankName: "",
      phoneNumber: "",
    );
  }

  BankContactModel copyWith({
    String? bankName,
    String? phoneNumber,
  }) {
    return BankContactModel(
      bankName: bankName ?? this.bankName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        bankName,
        phoneNumber,
      ];

  factory BankContactModel.fromJson(Map<String, dynamic> json) {
    return BankContactModel(
      bankName: json['bankName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}
