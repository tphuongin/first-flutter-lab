import 'package:myfirstflutter/models/product.dart';

class FoodByCategoryState {
  final List<Product> products;
  final Product? selectedProduct;

  FoodByCategoryState({
    required this.products,
    this.selectedProduct,
  });

  FoodByCategoryState copyWith({Product? selectedProduct}){
    return FoodByCategoryState(products: products, selectedProduct: selectedProduct ?? this.selectedProduct);
  }
}