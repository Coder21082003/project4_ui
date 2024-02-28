import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';

// ignore: must_be_immutable
class OrdersItemWidget extends StatelessWidget {
  const OrdersItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Chuột không dây Logitech",
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 3.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Opacity(
              opacity: 0.5,
              child: Text(
                "Shop Logitech \n Thời gian đặt 8:14 ngày 24 tháng 2 năm 2024",
                style: CustomTextStyles.bodySmallOnPrimary_1,
              ),
            ),
          ),
          SizedBox(height: 38.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "Trạng thái đơn hàng",
                    style: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                ),
              ),
              Text(
                "Đang giao",
                style: CustomTextStyles.bodySmallOnPrimary,
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Text(
                      "Số lượng",
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                ),
                Text(
                  "1",
                  style: CustomTextStyles.bodySmallOnPrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    "Giá",
                    style: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                ),
                Text(
                  "499.999 vnd",
                  style: CustomTextStyles.labelLargePrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: 1.v),
        ],
      ),
    );
  }
}
