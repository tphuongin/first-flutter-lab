import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required Product product})
    : super(ProductDetailState(product: product));

  void increaseQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decreaseQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void toggleLike() {
    emit(state.copyWith(isLiked: !state.isLiked));
  }

  void updateProduct(Product product) {
    emit(state.copyWith(product: product));
  }
}
