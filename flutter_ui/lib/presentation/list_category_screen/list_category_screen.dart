import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgArrowRight,
                              bikini: "Shirt", onTapBikiniIcon: () {
                            onTapArrowRight(context);
                          }),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgBikiniIcon,
                              bikini: "Bikini"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgDressIcon,
                              bikini: "Dress"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgManWorkEquipment,
                              bikini: "Work Equipment"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgManPantsIcon,
                              bikini: "Man Pants"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgManShoesIcon,
                              bikini: "Man Shoes"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgManUnderwearIcon,
                              bikini: "Man Underwear"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgManTShirtIcon,
                              bikini: "Man T-Shirt"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgWomanBagIcon,
                              bikini: "Woman Bag"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgWomanPantsIcon,
                              bikini: "Woman Pants"),
                          _buildCategoryOption(context,
                              bikiniIcon: ImageConstant.imgHighHeelsIcon,
                              bikini: "High Heels")
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Category", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildCategoryOption(
    BuildContext context, {
    required String bikiniIcon,
    required String bikini,
    Function? onTapBikiniIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: bikiniIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              onTap: () {
                onTapBikiniIcon!.call();
              }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(bikini,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapArrowRight(BuildContext context) {
    Navigator.pop(context);
  }
}
