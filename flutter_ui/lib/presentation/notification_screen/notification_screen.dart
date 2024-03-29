import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(children: [
                  _buildNotificationOption(context,
                      listIcon: ImageConstant.imgSort,
                      feed: "Offer", onTapNotificationOption: () {
                    onTapNotificationOption(context);
                  }),
                  _buildNotificationOption(context,
                      listIcon: ImageConstant.imgListIcon, feed: "Feed"),
                  SizedBox(height: 5.v),
                  _buildNotificationOption(context,
                      listIcon: ImageConstant.imgNotificationIconPrimary,
                      feed: "Acivity", onTapNotificationOption: () {
                    onTapNotificationOption1(context);
                  })
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Notification", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildNotificationOption(
    BuildContext context, {
    required String listIcon,
    required String feed,
    Function? onTapNotificationOption,
  }) {
    return GestureDetector(
        onTap: () {
          onTapNotificationOption!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: listIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(feed,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardPage);
  }

  /// Navigates to the notificationOfferScreen when the action is triggered.
  onTapNotificationOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationOfferScreen);
  }

  /// Navigates to the notificationActivityScreen when the action is triggered.
  onTapNotificationOption1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationActivityScreen);
  }
}
