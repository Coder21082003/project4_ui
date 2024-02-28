//
// class Product {
//   final String id;
//   final String name;
//   final String imagePath;
//   final double price;
//   final double salePrice;
//
//   Product({
//     required this.id,
//     required this.name,
//     required this.imagePath,
//     required this.price,
//     required this.salePrice,
//   });
// }
class Product {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final double salePrice;
  final double discountPercentage;
  final double rating;
  final Map<String, dynamic> details; // Thêm thuộc tính này

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.salePrice,
    required this.discountPercentage,
    required this.rating,
    required this.details, // Thêm vào constructor
  });
}

