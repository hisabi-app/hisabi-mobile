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

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      color: json['color'],
    );
  }
}
