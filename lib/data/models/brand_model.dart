import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  BrandModel({
    required this.brandName,
    required this.category,
    required this.brandId,
    required this.transactionsCount,
  });

  final String brandName;
  final Map<String, dynamic> category;
  final String brandId;
  final int transactionsCount;

  factory BrandModel.empty() {
    return BrandModel(
        brandName: "", category: {"": ""}, brandId: "", transactionsCount: 0);
  }

  BrandModel copyWith({
    String? brandName,
    Map<String, dynamic>? category,
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
      category: json['category'],
      brandId: json['id'],
      transactionsCount: json['transactionsCount'],
    );
  }
}
