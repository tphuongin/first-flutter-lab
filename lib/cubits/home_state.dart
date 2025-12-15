import '../models/product.dart';

class HomeState {
  final List<Product> products;
  final bool isLoading;

  const HomeState({this.products = const [], this.isLoading = true});

  HomeState copyWith({List<Product>? products, bool? isLoading}) {
    return HomeState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
