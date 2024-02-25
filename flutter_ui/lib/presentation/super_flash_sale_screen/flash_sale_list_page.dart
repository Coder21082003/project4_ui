import 'package:flutter/material.dart';


class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double salePrice;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
  });
}

class FlashSaleListPage extends StatelessWidget {
  // Tạo một danh sách sản phẩm giả lập
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Product 1',
      imageUrl: 'assets/images/product1.png',
      price: 100.0,
      salePrice: 50.0,
    ),
    // Thêm các sản phẩm khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Sale'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Price: \$${product.price} Sale: \$${product.salePrice}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
