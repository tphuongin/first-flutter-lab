class Product {
  final int id;
  final String name;
  final double price;
  final int categoryId;
  final String image;
  final String detail;
  final int quantity;
  final bool isLiked;
  final double rating;
  final String unit;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.image,
    required this.detail,
    this.quantity = 0,
    this.isLiked = false,
    this.rating = 4.5,
    this.unit = '',
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    int? categoryId,
    String? image,
    String? detail,
    int? quantity,
    bool? isLiked,
    double? rating,
    String? unit,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      image: image ?? this.image,
      detail: detail ?? this.detail,
      quantity: quantity ?? this.quantity,
      isLiked: isLiked ?? this.isLiked,
      rating: rating ?? this.rating,
      unit: unit ?? this.unit,
    );
  }
}
