import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/presentation/product_detail_page/product_detail_page.dart';

class FlashsaleItemWidget extends StatelessWidget {
  final Product product;

  const FlashsaleItemWidget({Key? key, required this.product})
      : super(key: key);

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
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        width: 141.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: product.imagePath, // Updated to use product image
              height: 109.adaptSize,
              width: 109.adaptSize,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
            SizedBox(height: 7.v),
            SizedBox(
              width: 105.h,
              child: Text(
                product.name, // Updated to use product name
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge!.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              "\$${product.salePrice.toStringAsFixed(2)}", // Updated to use product sale price
              style: CustomTextStyles.labelLargePrimary,
            ),
            SizedBox(height: 9.v),
            Row(
              children: [
                Text(
                  "\$${product.price.toStringAsFixed(2)}", // Updated to use product original price
                  style: CustomTextStyles.bodySmall10.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "${product.discountPercentage}% Off", // Updated to calculate discount percentage
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

