import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

class NotificationActivityScreen extends StatelessWidget {
  const NotificationActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildActivityDetails(context,
                      transactionNike: "Transaction Nike Air Zoom Product",
                      description:
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                      time: "April 30, 2014 1:01 PM", onTapTransactionIcon: () {
                    onTapTransactionIcon(context);
                  }),
                  _buildActivityDetails(context,
                      transactionNike: "Transaction Nike Air Max",
                      description:
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                      time: "April 30, 2014 1:01 PM"),
                  SizedBox(height: 5.v),
                  _buildActivityDetails(context,
                      transactionNike: "Transaction Nike Air Max 2",
                      description:
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                      time: "April 30, 2014 1:01 PM")
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
        title: AppbarSubtitle(
            text: "Activity", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildActivityDetails(
    BuildContext context, {
    required String transactionNike,
    required String description,
    required String time,
    Function? onTapTransactionIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgTransactionIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 94.v),
                  onTap: () {
                    onTapTransactionIcon!.call();
                  }),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactionNike,
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1))),
                            SizedBox(height: 11.v),
                            SizedBox(
                                width: 305.h,
                                child: Text(description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: appTheme.blueGray300,
                                        height: 1.80))),
                            SizedBox(height: 5.v),
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

  /// Navigates back to the previous screen.
  onTapTransactionIcon(BuildContext context) {
    Navigator.pop(context);
  }
}
