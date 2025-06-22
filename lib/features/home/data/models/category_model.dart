import 'package:hubx_example/features/home/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    if (json['image'] is String) {
      imageUrl = json['image'];
    } else if (json['image'] is Map) {
      imageUrl = json['image']['url'] ?? '';
    }

    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: imageUrl,
    );
  }

  factory CategoryModel.fromString(String data) {
    return CategoryModel(
      id: 1,
      name: data,
      image: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
