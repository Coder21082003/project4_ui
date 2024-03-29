import 'package:flutter_ui/presentation/product_detail_tab_container_screen/widgets/widget_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/presentation/product_detail_page/product_detail_page.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_ui/models/product.dart';

class ProductDetailTabContainerScreen extends StatefulWidget {
  final Product product; // Thêm biến thành viên để giữ sản phẩm được truyền vào

  const ProductDetailTabContainerScreen({Key? key, required this.product})
      : super(key: key);

  @override
  ProductDetailTabContainerScreenState createState() =>
      ProductDetailTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class ProductDetailTabContainerScreenState
    extends State<ProductDetailTabContainerScreen>
    with TickerProviderStateMixin {
  int sliderIndex = 1;

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
          body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 12.v),
              child: Column(
                children: [
                  _buildProductOverview(context),
                  SizedBox(height: 22.v),
                  _buildSelectSize(context),
                  SizedBox(
                    height: 1170.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        // Sử dụng widget.product để truyền đối tượng Product vào mỗi tab
                        ProductDetailPage(product: widget.product),
                        ProductDetailPage(product: widget.product),
                        ProductDetailPage(product: widget.product),
                      ],
                    ),
                  ),
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
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Nike Air Max 270 Rea...",
            margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNavExplore,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 15.h),
              onTap: () {
                onTapSearchIcon(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMoreIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 31.h))
        ]);
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
          options: CarouselOptions(
              height: 238.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                sliderIndex = index;
              }),
          itemCount: 1,
          itemBuilder: (context, index, realIndex) {
            return WidgetItemWidget();
          }),
      SizedBox(height: 16.v),
      SizedBox(
          height: 8.v,
          child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: 1,
              axisDirection: Axis.horizontal,
              effect: ScrollingDotsEffect(
                  spacing: 8,
                  activeDotColor: theme.colorScheme.primary.withOpacity(1),
                  dotColor: appTheme.blue50,
                  dotHeight: 8.v,
                  dotWidth: 8.h)))
    ]);
  }

  /// Section Widget
  Widget _buildProductOverview(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildSettings(context),
      SizedBox(height: 15.v),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                            width: 275.h,
                            child: Text("Nike Air Zoom Pegasus 36 Miami",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeOnPrimary
                                    .copyWith(height: 1.50)))),
                    CustomImageView(
                        imagePath: ImageConstant.imgLoveIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin:
                            EdgeInsets.only(left: 44.h, top: 2.v, bottom: 33.v))
                  ]))),
      SizedBox(height: 8.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomRatingBar(initialRating: 4, itemSize: 16)),
      SizedBox(height: 16.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("299,43", style: theme.textTheme.titleLarge))
    ]);
  }

  /// Section Widget
  Widget _buildSelectSize(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Select Size", style: theme.textTheme.titleSmall),
              SizedBox(height: 13.v),
              Container(
                  height: 48.v,
                  width: 368.h,
                  child: TabBar(
                      controller: tabviewController,
                      isScrollable: true,
                      labelColor: theme.colorScheme.onPrimary.withOpacity(1),
                      labelStyle: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      unselectedLabelColor:
                          theme.colorScheme.onPrimary.withOpacity(1),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                          borderRadius: BorderRadius.circular(24.h),
                          border: Border.all(
                              color: theme.colorScheme.primary.withOpacity(1),
                              width: 1.h)),
                      tabs: [
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("6")),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("6.5"))
                            ])),
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.h, vertical: 13.v),
                                  decoration: AppDecoration.outlinePrimary
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("7")),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.all(13.h),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("7.5"))
                            ])),
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("8")),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("8.5"))
                            ]))
                      ]))
            ])));
  }

  /// Common widget
  Widget _buildSeven(
    BuildContext context, {
    required String seven,
    required String seventyFive,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 48.adaptSize,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.v),
          decoration: AppDecoration.outlinePrimary
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
          child: Text(seven,
              style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1)))),
      Container(
          width: 48.adaptSize,
          margin: EdgeInsets.only(left: 16.h),
          padding: EdgeInsets.all(13.h),
          decoration: AppDecoration.outlineBlue
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
          child: Text(seventyFive,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchScreen);
  }
}
