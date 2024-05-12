import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  BrandModel({
    required this.brandName,
    required this.category,
    required this.brandId,
  });

  final String brandName;
  final Map<String, dynamic> category;
  final String brandId;

  factory BrandModel.empty() {
    return BrandModel(brandName: "", category: {"": ""}, brandId: "");
  }

  BrandModel copyWith({
    String? brandName,
    Map<String, dynamic>? category,
    String? brandId,
  }) {
    return BrandModel(
      brandName: brandName ?? this.brandName,
      category: category ?? this.category,
      brandId: brandId ?? this.brandId,
    );
  }

  @override
  List<Object?> get props => [brandName, category];

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandName: json['name'] as String,
      category: json['category'],
      brandId: json['id'],
    );
  }
}
