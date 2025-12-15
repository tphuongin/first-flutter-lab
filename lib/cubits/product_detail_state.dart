class ProductDetailState {
  final dynamic product;
  final int quantity;
  final bool isLiked;

  const ProductDetailState({
    required this.product,
    this.quantity = 1,
    this.isLiked = false,
  });

  ProductDetailState copyWith({dynamic product, int? quantity, bool? isLiked}) {
    return ProductDetailState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
