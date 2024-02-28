import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';

// ignore: must_be_immutable
class BlueItemWidget extends StatelessWidget {
  const BlueItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup475,
        height: 48.adaptSize,
        width: 48.adaptSize,
      ),
    );
  }
}
