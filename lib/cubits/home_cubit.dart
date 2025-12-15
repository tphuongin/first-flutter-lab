import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(isLoading: true)) {
    loadProducts();
  }

  void loadProducts() {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 5), () {
      final products = [
        Product(
          id: 1,
          name: 'Organic Bananas',
          price: 4.99,
          image: 'assets/images/products/banana.png',
          detail: 'Fresh and sweet organic banana',
          rating: 4.5,
          unit: '7pcs, Priceg',
        ),
        Product(
          id: 2,
          name: 'Red Apple',
          price: 4.99,
          image: 'assets/images/products/apple.png',
          detail: 'Crispy red apple',
          rating: 4.8,
          unit: '1kg, Priceg',
        ),
        Product(
          id: 3,
          name: 'Bell Pepper Red',
          price: 4.99,
          image: 'assets/images/products/pepper.png',
          detail: 'Fresh red bell pepper',
          rating: 4.3,
          unit: '1kg, Priceg',
        ),
        Product(
          id: 4,
          name: 'Ginger',
          price: 4.99,
          image: 'assets/images/products/ginger.png',
          detail: 'Fresh ginger root',
          rating: 4.6,
          unit: '250g, Priceg',
        ),
        Product(
          id: 5,
          name: 'Pulses',
          price: 5.99,
          image: 'assets/images/products/pulses.png',
          detail: 'Premium quality pulses',
          rating: 4.4,
          unit: '1kg, Priceg',
        ),
        Product(
          id: 6,
          name: 'Rice',
          price: 6.99,
          image: 'assets/images/products/rice.png',
          detail: 'High quality white rice',
          rating: 4.7,
          unit: '5kg, Priceg',
        ),
        Product(
          id: 7,
          name: 'Beef Bone',
          price: 12.99,
          image: 'assets/images/products/beef.png',
          detail: 'Fresh beef bone',
          rating: 4.5,
          unit: '500g, Priceg',
        ),
        Product(
          id: 8,
          name: 'Broiler Chicken',
          price: 9.99,
          image: 'assets/images/products/chicken.png',
          detail: 'Fresh broiler chicken',
          rating: 4.8,
          unit: '1kg, Priceg',
        ),
      ];
      emit(state.copyWith(products: products, isLoading: false));
    });
  }

  void toggleLike(int productId) {
    final updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(isLiked: !product.isLiked);
      }
      return product;
    }).toList();
    emit(state.copyWith(products: updatedProducts));
  }

  void increaseQuantity(int productId) {
    final updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(quantity: product.quantity + 1);
      }
      return product;
    }).toList();
    emit(state.copyWith(products: updatedProducts));
  }

  void decreaseQuantity(int productId) {
    final updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        if (product.quantity > 0) {
          return product.copyWith(quantity: product.quantity - 1);
        }
      }
      return product;
    }).toList();
    emit(state.copyWith(products: updatedProducts));
  }
}
