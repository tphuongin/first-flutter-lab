import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final Color color;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
    required this.description,
  });

  Category copyWith(String? name, String? image, Color? color, String? description){
    return Category(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
      color: color ?? this.color,
      description: description ?? this.description,
    );
  }
}
