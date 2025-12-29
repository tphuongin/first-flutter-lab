import 'package:myfirstflutter/models/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({
    required this.items,
  });

  CartState copyWith(List<CartItem> items){
    return CartState(items: items);
  }
}