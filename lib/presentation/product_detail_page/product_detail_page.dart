import '../product_detail_page/widgets/blue_item_widget.dart';
import '../product_detail_page/widgets/products1_item_widget.dart';
import '../product_detail_page/widgets/recomended_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_elevated_button.dart';
import 'package:flutter_ui/widgets/custom_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage>
    with AutomaticKeepAliveClientMixin<ProductDetailPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 23.v),
                  Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSelectColor(context),
                            SizedBox(height: 25.v),
                            _buildSpecifications(context),
                            SizedBox(height: 21.v),
                            _buildReview(context),
                            SizedBox(height: 23.v),
                            _buildYouMightAlsoLike(context),
                            SizedBox(height: 21.v),
                            CustomElevatedButton(
                                text: "Add To Cart",
                                margin: EdgeInsets.only(right: 16.h))
                          ]))
                ])))));
  }

  /// Section Widget
  Widget _buildSelectColor(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Select Color", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      SizedBox(
          height: 48.v,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: 6,
              itemBuilder: (context, index) {
                return BlueItemWidget();
              }))
    ]);
  }

  /// Section Widget
  Widget _buildSpecifications(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Specification", style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          _buildStyle(context,
              style: "Shown:",
              styleCode: "Laser Blue/Anthracite/Watermelon/White"),
          SizedBox(height: 14.v),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildStyle(context, style: "Style:", styleCode: "CD0113-400"),
            SizedBox(height: 19.v),
            Container(
                width: 320.h,
                margin: EdgeInsets.only(right: 23.h),
                child: Text(
                    "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(height: 1.80)))
          ])
        ]));
  }

  /// Section Widget
  Widget _buildReview(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildStyle(context, style: "Review Product", styleCode: "See More",
              onTapStyleCode: () {
            onTapTxtSeeMoreLink(context);
          }),
          SizedBox(height: 8.v),
          Row(children: [
            CustomRatingBar(initialRating: 4, itemSize: 16),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("4.5",
                    style: CustomTextStyles.labelMediumBluegray300)),
            Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text("(5 Review)", style: CustomTextStyles.bodySmall10))
          ]),
          SizedBox(height: 16.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageView(
                imagePath: ImageConstant.imgProfilePicture,
                height: 48.adaptSize,
                width: 48.adaptSize,
                radius: BorderRadius.circular(24.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("James Lawson", style: theme.textTheme.titleSmall),
                      SizedBox(height: 4.v),
                      CustomRatingBar(initialRating: 4, itemSize: 16)
                    ]))
          ]),
          SizedBox(height: 18.v),
          SizedBox(
              width: 339.h,
              child: Text(
                  "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(height: 1.80))),
          SizedBox(height: 13.v),
          SizedBox(
              height: 72.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 103.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Products1ItemWidget();
                  })),
          SizedBox(height: 16.v),
          Text("December 10, 2016", style: CustomTextStyles.bodySmall10)
        ]));
  }

  /// Section Widget
  Widget _buildYouMightAlsoLike(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("You Might Also Like", style: CustomTextStyles.titleSmall_1),
      SizedBox(height: 11.v),
      SizedBox(
          height: 238.v,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return RecomendedItemWidget();
              }))
    ]);
  }

  /// Common widget
  Widget _buildStyle(
    BuildContext context, {
    required String style,
    required String styleCode,
    Function? onTapStyleCode,
  }) {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(style,
              style: CustomTextStyles.bodySmallOnPrimary.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1)))),
      GestureDetector(onTap: () {
        onTapStyleCode!.call();
      }),
      Padding(
          padding: EdgeInsets.only(left: 234.h),
          child: Text(styleCode,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300)))
    ]);
  }

  /// Navigates to the reviewProductScreen when the action is triggered.
  onTapTxtSeeMoreLink(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reviewProductScreen);
  }
}
