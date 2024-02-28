import 'package:flutter_ui/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_elevated_button.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2), // Space between AppBar and image
            AspectRatio( // Fix the aspect ratio of the image
              aspectRatio: 3 / 3, // You can adjust the ratio according to your need
              child: Hero(
                tag: product.name,
                child: Image.asset(product.imagePath, fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity, // Make the Container fit the width of the device
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center( // Center the product name
                    child: Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text("Giá: \$${product.price}", style: TextStyle(fontSize: 20, color: Colors.black54)), // Giá sản phẩm
                  SizedBox(height: 5),
                  Text("Giảm giá: ${product.details['Sale']}", style: TextStyle(fontSize: 20, color: Colors.red)), // Phần trăm giảm giá
                  SizedBox(height: 5),
                  Text("Giá sau giảm: \$${product.salePrice}", style: TextStyle(fontSize: 20, color: Colors.green)), // Giá sau khi giảm
                  SizedBox(height: 10),
                  Text("Mô tả: ${product.details['Description']}", style: TextStyle(fontSize: 16, color: Colors.grey[800])), // Mô tả sản phẩm
                  SizedBox(height: 5),
                  // Text("Size: ${product.details['Size']}", style: TextStyle(fontSize: 16, color: Colors.grey[800])), // Size sản phẩm
                  // SizedBox(height: 5),
                  Text("Màu sắc: ${product.details['Color']}", style: TextStyle(fontSize: 16, color: Colors.grey[800])), // Màu sắc
                  SizedBox(height: 5),
                  Text("Bảo hành: ${product.details['Warranty']}", style: TextStyle(fontSize: 16, color: Colors.grey[800])), // Thời gian bảo hành
                ],
              ),
            ),
            SizedBox(height: 8), // Space between the info box and the Add to Cart button
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0), // Space between button and AppBar at the bottom
                child: ElevatedButton(
                  onPressed: () {
                    // Hành động khi nút được nhấn
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffB81736), // Nền của nút
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Tăng chiều cao của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Thêm vào giỏ hàng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center, // Căn chữ giữa nút
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}