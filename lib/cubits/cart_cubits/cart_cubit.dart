import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstflutter/cubits/cart_cubits/cart_state.dart';
import 'package:myfirstflutter/models/cart_item.dart';
import 'package:myfirstflutter/models/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));

  void addToCart(Product product) {
    final index = _findIndex(product);
    
    if (index == -1) {
      final newItem = CartItem(product: product, quantity: 1);
      emit(state.copyWith([...state.items, newItem]));
    } else {
      increaseQuantity(product);
    }
  }

  void increaseQuantity(Product product) {
    final index = _findIndex(product);
    if (index == -1) return;

    final newList = List<CartItem>.from(state.items);
    newList[index] = newList[index].copyWith(
      newList[index].quantity + 1,
    );
    
    emit(state.copyWith(newList));
  }

  void decreaseQuantity(Product product) {
    final index = _findIndex(product);
    if (index == -1) return;

    final newList = List<CartItem>.from(state.items);
    
    if (newList[index].quantity > 1) {
      newList[index] = newList[index].copyWith(
        newList[index].quantity - 1,
      );
    } else {
      newList.removeAt(index);
    }
    
    emit(state.copyWith(newList));
  }

  void removeFromCart(Product product) {
    final newList = state.items.where((item) => item.product.id != product.id).toList();
    emit(state.copyWith(newList));
  }

  // _ : private function
  int _findIndex(Product product) {
    return state.items.indexWhere((item) => item.product.id == product.id);
  }
}