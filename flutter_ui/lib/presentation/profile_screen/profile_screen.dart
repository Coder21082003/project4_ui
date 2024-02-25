import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 36.v),
                child: Column(children: [
                  _buildProfile(context),
                  SizedBox(height: 32.v),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgGenderIcon,
                      birthday: "Giới tính",
                      date: "Nam"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgDateIcon,
                      birthday: "Ngày sinh",
                      date: "21-08-2003"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgMessageIcon,
                      birthday: "Email",
                      date: "hung211242321@gmail.com"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgCreditCardIcon,
                      birthday: "Số điện thoại",
                      date: "0365256489"),
                  SizedBox(height: 5.v),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgTrophy,
                      birthday: "Đổi mật khẩu",
                      date: "•••••••••••••••••", onTapProfileDetailOption: () {
                    onTapProfileDetailOption(context);
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
            text: "Tài khoản", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
Widget _buildProfile(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.h),
              child: Image.asset(
                ImageConstant.imgProfilePictureBlank,
                height: 72.adaptSize,
                width: 72.adaptSize,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 14.v),
            child: Column(
              children: [
                Text("Nguyễn Đức Hưng", style: theme.textTheme.titleSmall),
                SizedBox(height: 8.v),
                Text("@nguyen_duc_hung", style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  /// Common widget
  Widget _buildProfileDetailOption(
    BuildContext context, {
    required String dateIcon,
    required String birthday,
    required String date,
    Function? onTapProfileDetailOption,
  }) {
    return GestureDetector(
        onTap: () {
          onTapProfileDetailOption!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: dateIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 2.v),
                  child: Text(birthday,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1)))),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                  child: Text(date,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.blueGray300))),
              CustomImageView(
                  imagePath: ImageConstant.imgRightIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 16.h))
            ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accountPage);
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapProfileDetailOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
  }

  
}
