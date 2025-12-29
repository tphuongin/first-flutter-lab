import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstflutter/cubits/category_state.dart';
import 'package:myfirstflutter/models/category.dart';

class CategoryCubit extends Cubit<CategoryState>{
    CategoryCubit() : super(CategoryState(categories: []));

    void loadCategories() {
      final categories = [
        Category(
          id: 1,
          name: 'Fresh Fruits\n& Vegetable',
          image: 'assets/images/explore/vegetable.png',
          color: const Color(0xFFD4E8F0),
          description: 'Explore our wide selection of farm-fresh organic vegetables and seasonal fruits. Sourced daily to ensure maximum nutrition and natural flavor for your healthy lifestyle.',
        ),
        Category(
          id: 2,
          name: 'Cooking Oil\n& Ghee',
          image: 'assets/images/explore/oil.png',
          color: const Color(0xFF2196F3),
          description: 'Premium quality cooking oils, olive oils, and pure traditional ghee. Perfect for all your culinary needs, from deep frying to dressing your favorite salads.',
        ),
        Category(
          id: 3,
          name: 'Meat & Fish',
          image: 'assets/images/explore/meat.png',
          color: const Color(0xFFFFCDD2),
          description: 'High-quality cuts of beef, poultry, and fresh seafood caught daily. We maintain a strict cold chain process to guarantee the freshness and safety of every product.',
        ),
        Category(
          id: 4,
          name: 'Bakery & Snacks',
          image: 'assets/images/explore/bakery.png',
          color: const Color(0xFFE1BEE7),
          description: 'Delight in our freshly baked artisan breads, sweet pastries, and a variety of savory snacks. The perfect treat for your tea time or quick hunger cravings.',
        ),
        Category(
          id: 5,
          name: 'Dairy & Eggs',
          image: 'assets/images/explore/dairy.png',
          color: const Color(0xFFFFF9C4),
          description: 'Nutritious dairy products including fresh milk, organic eggs, cheese, and yogurt. Essential daily staples delivered fresh from local dairy farms to your doorstep.',
        ),
        Category(
          id: 6,
          name: 'Beverages',
          image: 'assets/images/explore/beverages.png',
          color: const Color(0xFFB2DFDB),
          description: 'Quench your thirst with our collection of refreshing fruit juices, carbonated drinks, premium teas, and roasted coffee beans for an energetic day.',
        ),
      ];
      emit(state.copyWith(categories: categories));
  }

  void selectCategory(Category selectedCategory){
    emit(state.copyWith(selectedCategory: selectedCategory));
  }
    
}