import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the categories
    final List<Map<String, dynamic>> categories = [
      {'title': 'Kitchen', 'icon': Icons.kitchen},
      {'title': 'Appliances', 'icon': Icons.lightbulb},
      {'title': 'Entertainment', 'icon': Icons.gamepad},
      {'title': 'Food', 'icon': Icons.fastfood},
      {'title': 'Fashion', 'icon': Icons.checkroom},
      {'title': 'Electronics', 'icon': Icons.phonelink},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of columns here
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
          childAspectRatio: 1, // Aspect ratio of the items
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle the category tap
              // You can navigate to the category-specific page by using Navigator.pushNamed
              // For example: Navigator.pushNamed(context, '/${categories[index]['title'].toLowerCase()}');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    categories[index]['icon'],
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8), // For spacing between icon and text
                Text(categories[index]['title']),
              ],
            ),
          );
        },
      ),
    );
  }
}
