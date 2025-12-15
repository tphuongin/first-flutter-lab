import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
}

class ExploreState {
  final List<Category> categories;

  const ExploreState({this.categories = const []});

  ExploreState copyWith({List<Category>? categories}) {
    return ExploreState(categories: categories ?? this.categories);
  }
}
