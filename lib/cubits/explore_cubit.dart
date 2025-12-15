import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(const ExploreState()) {
    loadCategories();
  }

  void loadCategories() {
    final categories = [
      Category(
        id: 1,
        name: 'Fresh Fruits\n& Vegetable',
        image: 'assets/images/explore/vegetable.png',
        color: const Color(0xFFD4E8F0),
      ),
      Category(
        id: 2,
        name: 'Cooking Oil\n& Ghee',
        image: 'assets/images/explore/oil.png',
        color: const Color(0xFF2196F3),
      ),
      Category(
        id: 3,
        name: 'Meat & Fish',
        image: 'assets/images/explore/meat.png',
        color: const Color(0xFFFFCDD2),
      ),
      Category(
        id: 4,
        name: 'Bakery & Snacks',
        image: 'assets/images/explore/bakery.png',
        color: const Color(0xFFE1BEE7),
      ),
      Category(
        id: 5,
        name: 'Dairy & Eggs',
        image: 'assets/images/explore/dairy.png',
        color: const Color(0xFFFFF9C4),
      ),
      Category(
        id: 6,
        name: 'Beverages',
        image: 'assets/images/explore/beverages.png',
        color: const Color(0xFFB2DFDB),
      ),
    ];
    emit(state.copyWith(categories: categories));
  }
}
