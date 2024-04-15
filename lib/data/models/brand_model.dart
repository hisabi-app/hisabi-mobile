import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  const BrandModel({
    required this.brandName,
    required this.category,
  });

  final String brandName;
  final String category;

  factory BrandModel.empty() {
    return const BrandModel(brandName: "", category: "");
  }

  BrandModel copyWith({
    String? brandName,
    String? category,
  }) {
    return BrandModel(
      brandName: brandName ?? this.brandName,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [brandName, category];
}
