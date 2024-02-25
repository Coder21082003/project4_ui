import 'package:flutter_ui/presentation/explore_page/widgets/categories2_item_widget.dart';
import 'package:flutter_ui/presentation/explore_page/widgets/categories3_item_widget.dart';
import 'package:flutter_ui/presentation/explore_page/widgets/categories4_item_widget.dart';
import 'package:flutter_ui/presentation/explore_page/widgets/categories5_item_widget.dart';

import '../explore_page/widgets/categories1_item_widget.dart';
import '../explore_page/widgets/categories_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_title_searchview.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
          child: Column(
            children: [
              _buildFood(context),
              SizedBox(height: 37.v),
              _buildElectronice(context),
              SizedBox(height: 37.v),
              _buildHouseware(context),
              SizedBox(height: 37.v),
              _buildSport(context),
              SizedBox(height: 37.v),
              _buildFashion(context),
              SizedBox(height: 37.v),
              _buildTvFridge(context),
              SizedBox(height: 37.v),
            ],
          ),
        ),
      ),
    ),
  );
}

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "Search Product",
            controller: searchController),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h)),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon(context);
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildFood(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Đồ ăn, thực phẩm", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return CategoriesItemWidget();
          })
    ]);
  }

  /// Section Widget
  Widget _buildElectronice(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Đồ điện tử", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Categories1ItemWidget();
          })
    ]);
  }

    /// Section Widget
  Widget _buildHouseware(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Đồ gia dụng, nội thất, cây cảnh", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Categories2ItemWidget();
          })
    ]);
  }


    /// Section Widget
  Widget _buildSport(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Giải trí, Thể thao, Sở thích", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Categories3ItemWidget();
          })
    ]);
  }


    /// Section Widget
  Widget _buildFashion(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Thời trang, Đồ dùng cá nhân", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Categories4ItemWidget();
          })
    ]);
  }


    /// Section Widget
  Widget _buildTvFridge(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Tủ lạnh, máy lạnh, máy giặt", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 115.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Categories5ItemWidget();
          })
    ]);
  }


  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  //not build yet
  onTapNotThing(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Note",
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            "This fuction is not availble yet",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
