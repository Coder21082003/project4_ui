import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/presentation/product_detail_page/product_detail_page.dart';
import 'package:flutter_ui/widgets/custom_rating_bar.dart';
import 'package:flutter_ui/models/product.dart';


class ProductsItemWidget extends StatelessWidget {
  final Product product; // Thêm trường product để truyền thông tin sản phẩm

  const ProductsItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: product.imagePath, // Sử dụng imagePath từ đối tượng product
                height: 133.adaptSize,
                width: 133.adaptSize,
                radius: BorderRadius.circular(5.h),
              ),
              SizedBox(height: 8.v),
              SizedBox(
                width: 107.h,
                child: Text(
                  product.name, // Sử dụng tên sản phẩm từ đối tượng product
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 4.v),
              CustomRatingBar(
                ignoreGestures: true,
                initialRating: product.rating, // Sử dụng đánh giá từ đối tượng product
              ),
              SizedBox(height: 18.v),
              Text(
                "\$${product.salePrice}", // Sử dụng giá khuyến mãi từ đối tượng product
                style: CustomTextStyles.labelLargePrimary,
              ),
              SizedBox(height: 5.v),
              Row(
                children: [
                  Text(
                    "\$${product.price}", // Sử dụng giá gốc từ đối tượng product
                    style: CustomTextStyles.bodySmall10.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "${product.discountPercentage}% Off", // Tính phần trăm giảm giá từ đối tượng product
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
