import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> exclusiveProducts = [
    {
      'name': 'Organic Banana',
      'price': 4.99,
      'image': 'assets/images/products/banana.png',
    },
    {
      'name': 'Red Apple',
      'price': 4.99,
      'image': 'assets/images/products/apple.png',
    },
  ];

  final List<Map<String, dynamic>> bestSellingProducts = [
    {
      'name': 'Bell Pepper Red',
      'price': 4.99,
      'image': 'assets/images/products/pepper.png',
    },
    {
      'name': 'Ginger',
      'price': 4.99,
      'image': 'assets/images/products/ginger.png',
    },
  ];

  final List<Map<String, dynamic>> groceriesProducts = [
    {'name': 'Pulses', 'image': 'assets/images/products/pulses.png'},
    {'name': 'Rice', 'image': 'assets/images/products/rice.png'},
    {
      'name': 'Beef Bone',
      'price': 4.99,
      'image': 'assets/images/products/beef.png',
    },
    {
      'name': 'Broiler Chicken',
      'price': 4.99,
      'image': 'assets/images/products/chicken.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Header with Location and Search
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/carrot.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Dhaka, Bangladesh',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.more_vert, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Store',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildBannerSection('Fresh Vegetables', 'See all'),
              const SizedBox(height: 12),

              _buildSectionHeader('Exclusive Offer', 'See all'),
              const SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveProducts.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final product = exclusiveProducts[index];
                    return _buildProductCard(
                      product['name'],
                      product['price'],
                      product['image'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              _buildSectionHeader('Best Selling', 'See all'),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: bestSellingProducts.length,
                itemBuilder: (context, index) {
                  final product = bestSellingProducts[index];
                  return _buildGridProductCard(
                    product['name'],
                    product['price'],
                    product['image'],
                  );
                },
              ),
              const SizedBox(height: 16),

              _buildSectionHeader('Groceries', 'See all'),
              const SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final product = groceriesProducts[index];
                    return _buildProductCard(
                      product['name'],
                      product.containsKey('price') ? product['price'] : 0.0,
                      product['image'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  final product = groceriesProducts[index + 2];
                  return _buildGridProductCard(
                    product['name'],
                    product['price'],
                    product['image'],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _selectedIndex == 0
                  ? const Color(0xFF53B175)
                  : Colors.grey,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              color: _selectedIndex == 1
                  ? const Color(0xFF53B175)
                  : Colors.grey,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: _selectedIndex == 2
                  ? const Color(0xFF53B175)
                  : Colors.grey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: _selectedIndex == 3
                  ? const Color(0xFF53B175)
                  : Colors.grey,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: _selectedIndex == 4
                  ? const Color(0xFF53B175)
                  : Colors.grey,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSection(String title, String actionText) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/images/home/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          actionText,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF53B175),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, double price, String imagePath) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: 70,
                  color: Colors.grey.withOpacity(0.5),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              width: 40,
              height: 32,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridProductCard(String name, double? price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.grey.withOpacity(0.5),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                if (price != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (price != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                width: 40,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
