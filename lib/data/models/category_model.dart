import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.type,
  });

  final String id;
  final String name;
  final String type;
  final String color;

  @override
  List<Object?> get props => [id, name, type, color];

  factory CategoryModel.empty() {
    return CategoryModel(id: "", name: "", color: "", type: "");
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      color: json['color'],
    );
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    String? type,
    String? color,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      color: color ?? this.color,
    );
  }
}
