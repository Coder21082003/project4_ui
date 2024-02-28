import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_icon_button.dart';


// ignore: must_be_immutable
class CartItemWidget extends StatefulWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 1; // Giả sử mỗi sản phẩm bắt đầu với số lượng là 1

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 14), // Sử dụng margin ở đây
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // Sử dụng BorderRadius ở đây
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), // Sử dụng ClipRRect để áp dụng bo viền cho ảnh
              child: Image.asset(
                "assets/images/iphone_15.png",
                height: 72, // Bỏ .adaptSize cho đơn giản, hoặc thay bằng cách tính toán kích thước phù hợp
                width: 72, // Tương tự như trên
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.h,
                    child: Text(
                      "iPhone 15",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgLoveIconPink300,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      bottom: 11.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgTrashIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(
                      left: 8.h,
                      bottom: 11.v,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.v),
              SizedBox(
                width: 227.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1000.00",
                      style: CustomTextStyles.labelLargePrimary,
                    ),
                    Spacer(),
                    SizedBox(
                      height: 20.v,
                      width: 41.h,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 20.v,
                              width: 41.h,
                              decoration: BoxDecoration(
                                color: appTheme.blue50,
                                border: Border.all(
                                  color: appTheme.blue50,
                                  width: 1.h,
                                  strokeAlign: strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                Align(
                  alignment: Alignment.centerLeft, // Điều chỉnh alignment để di chuyển sang trái
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Sử dụng MainAxisSize.min để Row chiếm đúng kích thước của nội dung bên trong
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: 20), // Adjust icon size as needed
                          onPressed: _decrementQuantity,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8), // Thêm padding ngang cho số lượng
                          child: Text(
                            "$quantity",
                            style: TextStyle(fontSize: 16), // Fixed font size
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, size: 20), // Adjust icon size as needed
                          onPressed: _incrementQuantity,
                        ),
                      ],
                    ),
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
