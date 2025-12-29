import 'package:myfirstflutter/models/category.dart';

class CategoryState {
  final List<Category> categories;
  final Category? selectedCategory;

  CategoryState({
    required this.categories,
    this.selectedCategory,
  });

  CategoryState copyWith({List<Category>? categories, Category? selectedCategory}){
    return CategoryState(categories: categories ?? this.categories, selectedCategory: selectedCategory ?? this.selectedCategory);
  }
}