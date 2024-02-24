import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Categories1ItemWidget extends StatelessWidget {
  const Categories1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgWomanTShirtIcon,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          "T-Shirt",
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
