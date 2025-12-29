import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstflutter/cubits/cart_cubits/cart_cubit.dart';
import 'package:myfirstflutter/cubits/cart_cubits/cart_state.dart';
import 'package:myfirstflutter/cubits/cart_cubits/food_by_category_cubit.dart';
import 'package:myfirstflutter/cubits/cart_cubits/food_by_category_state.dart';
import 'package:myfirstflutter/cubits/category_cubit.dart';
import 'package:myfirstflutter/cubits/category_state.dart';
import 'package:myfirstflutter/models/cart_item.dart';
import 'package:myfirstflutter/models/category.dart';
import 'package:myfirstflutter/widgets/custom_bottom_navigation_bar.dart';

import '../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _showProductList = false;
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()..loadCategories()),
        BlocProvider(create: (context) => FoodByCategoryCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Dropdown
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return CustomScrollableDropdown<Category>(
                    label: 'Food Type',
                    hint: 'Select food type',
                    selectedValue: state.selectedCategory,
                    items: state.categories,
                    getItemName: (cat) => cat.name,
                    getItemImage: (cat) => cat.image,
                    onSelect: (category) {
                      context.read<CategoryCubit>().selectCategory(category);
                      context.read<FoodByCategoryCubit>().loadProductByCategory(
                        category.id,
                      );
                    },
                  );
                },
              ),

              // Detail Information
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, categoryState) {
                  if (categoryState.selectedCategory == null) {
                    return const SizedBox.shrink();
                  }

                  final category = categoryState.selectedCategory!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Information About ${category.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.description,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Select Item Button with Product Dropdown
                      BlocBuilder<FoodByCategoryCubit, FoodByCategoryState>(
                        builder: (context, productState) {
                          return CustomScrollableDropdown<Product>(
                            label: 'Select Item',
                            hint: 'Choose a product',
                            selectedValue: null,
                            items: productState.products,
                            getItemName: (prod) => prod.name,
                            getItemImage: (prod) => prod.image,
                            onSelect: (product) {
                              context.read<CartCubit>().addToCart(product);
                              setState(() {
                                _showProductList = true;
                              });
                            },
                          );
                        },
                      ),

                      // Cart Items List
                      if (_showProductList)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, cartState) {
                                if (cartState.items.isEmpty) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text('Chưa có sản phẩm nào'),
                                  );
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Giỏ hàng',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: cartState.items.length,
                                      itemBuilder: (context, index) {
                                        final cartItem = cartState.items[index];
                                        final product = cartItem.product;
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 12,
                                          ),
                                          child: Row(
                                            children: [
                                              // Product Image
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  product.image,
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) {
                                                        return Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[200],
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8,
                                                                ),
                                                          ),
                                                          child: const Icon(
                                                            Icons
                                                                .image_not_supported,
                                                          ),
                                                        );
                                                      },
                                                ),
                                              ),
                                              const SizedBox(width: 12),

                                              // Product Info
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      '\$${product.price}',
                                                      style: const TextStyle(
                                                        color: Color(
                                                          0xFF58A773,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // Quantity Controls
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey[300]!,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<CartCubit>()
                                                            .decreaseQuantity(
                                                              product,
                                                            );
                                                      },
                                                      child: Container(
                                                        width: 28,
                                                        height: 28,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          '−',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(
                                                              0xFF58A773,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: BlocBuilder<CartCubit, CartState>(
                                                        builder: (context, cartState) {
                                                          final cartItem = cartState
                                                              .items
                                                              .cast<CartItem?>()
                                                              .firstWhere(
                                                                (item) =>
                                                                    item
                                                                        ?.product
                                                                        .id ==
                                                                    product.id,
                                                                orElse: () =>
                                                                    null,
                                                              );
                                                          final quantity =
                                                              cartItem
                                                                  ?.quantity ??
                                                              1;
                                                          return Text(
                                                            '$quantity',
                                                            style:
                                                                const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<CartCubit>()
                                                            .addToCart(product);
                                                      },
                                                      child: Container(
                                                        width: 28,
                                                        height: 28,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          '+',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(
                                                              0xFF58A773,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class CustomScrollableDropdown<T> extends StatefulWidget {
  final String label;
  final String hint;
  final T? selectedValue;
  final List<T> items;
  final String Function(T) getItemName;
  final String Function(T) getItemImage;
  final Function(T) onSelect;

  const CustomScrollableDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedValue,
    required this.items,
    required this.getItemName,
    required this.getItemImage,
    required this.onSelect,
  });

  @override
  State<CustomScrollableDropdown<T>> createState() =>
      _CustomScrollableDropdownState<T>();
}

class _CustomScrollableDropdownState<T>
    extends State<CustomScrollableDropdown<T>> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF58A773),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue.shade400, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.selectedValue != null
                            ? widget.getItemName(widget.selectedValue!)
                            : widget.hint,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            constraints: const BoxConstraints(maxHeight: 250),
            decoration: BoxDecoration(
              color: const Color(0xFF58A773),
              border: Border(
                top: BorderSide(color: Colors.blue.shade400, width: 2),
              ),
            ),
            child: widget.items.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'No items available',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.items.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.white24),
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.getItemImage(item),
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => const Icon(
                                  Icons.fastfood,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.getItemName(item),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: ElevatedButton(
                                onPressed: () {
                                  widget.onSelect(item);
                                  setState(() {
                                    _isExpanded = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE0E0E0),
                                  foregroundColor: const Color(0xFF58A773),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'Select',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
      ],
    );
  }
}
