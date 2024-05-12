import 'package:equatable/equatable.dart';
import 'package:hisabi_mobile_flutter/data/models/category_model.dart';

class BrandModel extends Equatable {
  BrandModel({
    required this.brandName,
    required this.category,
    required this.brandId,
    required this.transactionsCount,
  });

  final String brandName;
  final CategoryModel category;
  final String brandId;
  final int transactionsCount;

  factory BrandModel.empty() {
    return BrandModel(
        brandName: "",
        category: CategoryModel.empty(),
        brandId: "",
        transactionsCount: 0);
  }

  BrandModel copyWith({
    String? brandName,
    CategoryModel? category,
    String? brandId,
    int? transactionsCount,
  }) {
    return BrandModel(
      brandName: brandName ?? this.brandName,
      category: category ?? this.category,
      brandId: brandId ?? this.brandId,
      transactionsCount: transactionsCount ?? this.transactionsCount,
    );
  }

  @override
  List<Object?> get props => [brandName, category, brandId, transactionsCount];

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandName: json['name'] as String,
      category: CategoryModel.empty().copyWith(name: json['category']['name']),
      brandId: json['id'],
      transactionsCount: json['transactionsCount'],
    );
  }
}
