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
                      birthday: "Gender",
                      date: "Male"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgDateIcon,
                      birthday: "Birthday",
                      date: "12-12-2000"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgMessageIcon,
                      birthday: "Email",
                      date: "rex4dom@gmail.com"),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgCreditCardIcon,
                      birthday: "Phone Number",
                      date: "(307) 555-0133"),
                  SizedBox(height: 5.v),
                  _buildProfileDetailOption(context,
                      dateIcon: ImageConstant.imgTrophy,
                      birthday: "Change Password",
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
            text: "Profile", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgProfilePicture72x72,
                  height: 72.adaptSize,
                  width: 72.adaptSize,
                  radius: BorderRadius.circular(36.h)),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 14.v),
                  child: Column(children: [
                    Text("Dominic Ovo", style: theme.textTheme.titleSmall),
                    SizedBox(height: 8.v),
                    Text("@dominic_ovo", style: theme.textTheme.bodySmall)
                  ]))
            ])));
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
    Navigator.pop(context);
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapProfileDetailOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
  }
}
