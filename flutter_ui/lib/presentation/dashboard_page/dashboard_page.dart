import '../dashboard_page/widgets/arrowright_item_widget.dart';
import '../dashboard_page/widgets/flashsale_item_widget.dart';
import '../dashboard_page/widgets/megasale_item_widget.dart';
import '../dashboard_page/widgets/offerbanner_item_widget.dart';
import '../dashboard_page/widgets/products_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
                        child: Column(children: [
                          _buildOfferBannerTitle(context),
                          SizedBox(height: 25.v),
                          _buildCategories(context),
                          SizedBox(height: 37.v),
                          _buildFlashSale1(context),
                          SizedBox(height: 23.v),
                          _buildMegaSale1(context),
                          SizedBox(height: 29.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRecomendedProduct,
                              height: 206.v,
                              width: 343.h,
                              radius: BorderRadius.circular(5.h),
                              alignment: Alignment.centerLeft),
                          SizedBox(height: 16.v),
                          _buildProducts(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgRewind,
            margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
        title: AppbarSubtitleOne(
            text: "Search Product",
            margin: EdgeInsets.only(left: 8.h),
            onTap: () {
              onTapSearchProduct(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapLoveIcon(context);
              }),
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
  Widget _buildOfferBannerTitle(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: CarouselSlider.builder(
              options: CarouselOptions(
                  height: 206.v,
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
                return OfferbannerItemWidget();
              })),
      SizedBox(height: 16.v),
      Container(
          height: 8.v,
          margin: EdgeInsets.only(left: 135.h),
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
  Widget _buildCategories(BuildContext context) {
    final categories = [
      {'name': 'Đồ ăn', 'icon': Icons.fastfood, 'route': AppRoutes.food},
      {'name': 'Đồ bếp', 'icon': Icons.kitchen, 'route': AppRoutes.kitchen},
      {'name': 'Đồ điện tử', 'icon': Icons.computer, 'route': AppRoutes.electronics},
      {'name': 'Đồ gia dụng', 'icon': Icons.lightbulb_outline, 'route': AppRoutes.appliances},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: _buildFlashSaleHeader(context,
              flashSale: "Category",
              seeMoreLink: "More Category", onTapSeeMoreLink: () {
                onTapMoreCategoryLink(context);
              })),
      SizedBox(height: 10.v),
      Container(
        height: 94.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.map((category) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, category['route'] as String);
                },
                child: ArrowrightItemWidget(
                  title: category['name'] as String,
                  icon: category['icon'] as IconData, // Pass the icon here
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }


  /// Section Widget
  Widget _buildFlashSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return FlashsaleItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildFlashSale1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: _buildFlashSaleHeader(context,
              flashSale: "Flash Sale",
              seeMoreLink: "See More",
              onTapSeeMoreLink: () {
            onTapFlashSaleListPage(context);
              },
              onTapFlashSaleHeader: () {
            onTapFlashSaleHeader(context);
          })),
      SizedBox(height: 12.v),
      _buildFlashSale(context)
    ]);
  }

  /// Section Widget
  Widget _buildMegaSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return MegasaleItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildMegaSale1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: _buildFlashSaleHeader(context,
              flashSale: "Mega Sale", seeMoreLink: "See More")),
      SizedBox(height: 10.v),
      _buildMegaSale(context)
    ]);
  }

  /// Section Widget
  Widget _buildProducts(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 283.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 13.h,
                    crossAxisSpacing: 13.h),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductsItemWidget();
                })));
  }


  /// Common widget
  Widget _buildFlashSaleHeader(
      BuildContext context, {
        required String flashSale,
        required String seeMoreLink,
        Function? onTapFlashSaleHeader,
        Function? onTapSeeMoreLink,
      }) {
    return InkWell(
      onTap: () {
        onTapFlashSaleHeader?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            flashSale,
            style: theme.textTheme.titleSmall!
                .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)),
          ),
          InkWell(
            onTap: () {
              onTapSeeMoreLink?.call();
            },
            child: Text(
              seeMoreLink,
              style: CustomTextStyles.titleSmallPrimary
                  .copyWith(color: theme.colorScheme.primary.withOpacity(1)),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchProduct(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchScreen);
  }

  /// Navigates to the favoriteProductScreen when the action is triggered.
  onTapLoveIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.favoriteProductScreen);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  /// Navigates to the listCategoryScreen when the action is triggered.
  // onTapTxtMoreCategoryLink(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.listCategoryScreen);
  // }
  onTapFlashSaleListPage(BuildContext context){
    Navigator.pushNamed(context, AppRoutes.flashSaleListPage);
  }
  /// Navigates to the superFlashSaleScreen when the action is triggered.
  onTapFlashSaleHeader(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.superFlashSaleScreen);
  }
  onTapMoreCategoryLink(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.allCategories);
  }

}
