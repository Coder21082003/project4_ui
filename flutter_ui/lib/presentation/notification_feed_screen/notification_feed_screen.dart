import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

class NotificationFeedScreen extends StatelessWidget {
  const NotificationFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildFeedItem(context,
                      productImage: ImageConstant.imgProductImage,
                      bestProduct: "New Product",
                      nikeAirZoomPegasus:
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                      time: "June 3, 2015 5:06 PM"),
                  _buildFeedItem(context,
                      productImage: ImageConstant.imgImageProduct,
                      bestProduct: "Best Product",
                      nikeAirZoomPegasus:
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                      time: "June 3, 2015 5:06 PM"),
                  SizedBox(height: 5.v),
                  _buildFeedItem(context,
                      productImage: ImageConstant.imgProductImage1,
                      bestProduct: "New Product",
                      nikeAirZoomPegasus:
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                      time: "June 3, 2015 5:06 PM")
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title:
            AppbarSubtitle(text: "Feed", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildFeedItem(
    BuildContext context, {
    required String productImage,
    required String bestProduct,
    required String nikeAirZoomPegasus,
    required String time,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: productImage,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(5.h),
              margin: EdgeInsets.only(bottom: 40.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bestProduct,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        SizedBox(height: 6.v),
                        SizedBox(
                            width: 269.h,
                            child: Text(nikeAirZoomPegasus,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: appTheme.blueGray300,
                                    height: 1.80))),
                        SizedBox(height: 1.v),
                        Text(time,
                            style: CustomTextStyles.bodySmallOnPrimary10
                                .copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1)))
                      ])))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }
}
