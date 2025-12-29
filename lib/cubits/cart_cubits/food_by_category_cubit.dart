import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstflutter/cubits/cart_cubits/food_by_category_state.dart';
import 'package:myfirstflutter/models/product.dart';

class FoodByCategoryCubit extends Cubit<FoodByCategoryState>{
  FoodByCategoryCubit(): super(FoodByCategoryState(products: []));

  void loadProductByCategory(int categoryId){
      final products = [
        Product(
          id: 1,
          name: 'Organic Bananas',
          price: 4.99,
          categoryId: 1, // Fresh Fruits & Vegetable
          image: 'assets/images/products/banana.png',
          detail: 'Naturally ripened organic bananas, rich in potassium and fiber. Perfect for a healthy breakfast or a quick energy-boosting snack throughout the day.',
          rating: 4.5,
          unit: '7pcs, Price',
        ),
        Product(
          id: 2,
          name: 'Red Apple',
          price: 4.99,
          categoryId: 1, // Fresh Fruits & Vegetable
          image: 'assets/images/products/apple.png',
          detail: 'Sweet and crunchy premium red apples sourced from high-altitude orchards. Packed with antioxidants and vitamins to keep you healthy and refreshed.',
          rating: 4.8,
          unit: '1kg, Price',
        ),
        Product(
          id: 3,
          name: 'Bell Pepper Red',
          price: 4.99,
          categoryId: 1, // Fresh Fruits & Vegetable
          image: 'assets/images/products/pepper.png',
          detail: 'Bright and crisp red bell peppers. Ideal for stir-fries, salads, or stuffing, providing a rich source of Vitamin C and a sweet, mild flavor.',
          rating: 4.3,
          unit: '1kg, Price',
        ),
        Product(
          id: 4,
          name: 'Ginger',
          price: 4.99,
          categoryId: 1, // Fresh Fruits & Vegetable
          image: 'assets/images/products/ginger.png',
          detail: 'Fresh and aromatic ginger root, essential for adding a warm, spicy kick to your dishes or brewing a soothing, healthy herbal tea.',
          rating: 4.6,
          unit: '250g, Price',
        ),
        Product(
          id: 5,
          name: 'Pulses',
          price: 5.99,
          categoryId: 2, // Cooking Oil & Ghee (Hoặc Dry Grocery nếu bạn có thêm category mới)
          image: 'assets/images/products/pulses.png',
          detail: 'Premium quality organic pulses, a great plant-based protein source. Easy to cook and perfect for traditional soups, stews, and healthy bowls.',
          rating: 4.4,
          unit: '1kg, Price',
        ),
        Product(
          id: 6,
          name: 'Rice',
          price: 6.99,
          categoryId: 2, // Thường đi cùng nhóm Cooking Oil/Staples
          image: 'assets/images/products/rice.png',
          detail: 'Long-grain aromatic white rice, cleaned and processed to maintain its natural fragrance. The perfect foundation for your daily family meals.',
          rating: 4.7,
          unit: '5kg, Price',
        ),
        Product(
          id: 7,
          name: 'Beef Bone',
          price: 12.99,
          categoryId: 3, // Meat & Fish
          image: 'assets/images/products/beef.png',
          detail: 'Freshly cut beef marrow bones, perfect for slow-cooking rich, nutrient-dense broths and soups. High in collagen and authentic flavor.',
          rating: 4.5,
          unit: '500g, Price',
        ),
        Product(
          id: 8,
          name: 'Broiler Chicken',
          price: 9.99,
          categoryId: 3, // Meat & Fish
          image: 'assets/images/products/chicken.png',
          detail: 'Tender and juicy whole broiler chicken. Processed under strict hygiene standards, ideal for roasting, grilling, or traditional curries.',
          rating: 4.8,
          unit: '1kg, Price',
        ),
      ];
      final filtered = products.where((p) => p.categoryId == categoryId).toList();
      emit(FoodByCategoryState(products: filtered));
  }

  void selectProduct(Product product){
    emit(state.copyWith(selectedProduct: product));
  }
}