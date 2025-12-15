import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Fresh Fruits\n& Vegetable',
      'image': 'assets/images/explore/vegetable.png',
      'color': const Color(0xFFD4E8F0),
    },
    {
      'name': 'Cooking Oil\n& Ghee',
      'image': 'assets/images/explore/oil.png',
      'color': const Color(0xFF2196F3),
      'highlighted': true,
    },
    {
      'name': 'Meat & Fish',
      'image': 'assets/images/explore/meat.png',
      'color': const Color(0xFFFFCDD2),
    },
    {
      'name': 'Bakery & Snacks',
      'image': 'assets/images/explore/bakery.png',
      'color': const Color(0xFFE1BEE7),
    },
    {
      'name': 'Dairy & Eggs',
      'image': 'assets/images/explore/dairy.png',
      'color': const Color(0xFFFFF9C4),
    },
    {
      'name': 'Beverages',
      'image': 'assets/images/explore/beverages.png',
      'color': const Color(0xFFB2DFDB),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Find Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isHighlighted = category['highlighted'] ?? false;
                  return _buildCategoryCard(
                    category['name'],
                    category['image'],
                    category['color'],
                    isHighlighted,
                  );
                },
              ),
              const SizedBox(height: 30),
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
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
              break;
            case 1:
              break;
            case 2:
            case 3:
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
          }
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

  Widget _buildCategoryCard(
    String name,
    String imagePath,
    Color color,
    bool highlighted,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: highlighted
              ? Border.all(color: const Color(0xFF2196F3), width: 3)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: 80,
                  color: Colors.grey.withOpacity(0.5),
                );
              },
            ),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
