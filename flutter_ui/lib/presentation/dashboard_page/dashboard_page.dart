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
import 'package:flutter_ui/models/product.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  int sliderIndex = 1;
  // List<Product> fakeProducts = List.generate(5, (index) {
  //   return Product(
  //     id: 'prod-$index',
  //     name: 'Product $index',
  //     imagePath: 'assets/images/img_product_image_${index + 1}.png',
  //     // Đảm bảo rằng bạn có ảnh sản phẩm trong thư mục assets
  //     price: 100.0 + (index * 10),
  //     // Giá gốc tăng dần
  //     salePrice: 50.0 + (index * 10), // Giá sale tăng dần
  //   );
  // });
  //
  // List<Product> megaSaleProducts = List.generate(5, (index) {
  //   return Product(
  //     id: 'prod-$index',
  //     name: 'Product $index',
  //     imagePath: 'assets/images/img_product_image_${index + 1}.png',
  //     // Đảm bảo rằng bạn có ảnh sản phẩm trong thư mục assets
  //     price: 100.0 + (index * 10),
  //     // Giá gốc tăng dần
  //     salePrice: 50.0 + (index * 10), // Giá sale tăng dần
  //   );
  // });
  //
  //
  // List<Product> gridProducts = List.generate(10, (index) {
  //   return Product(
  //     id: 'prod-$index',
  //     name: 'Product $index',
  //     imagePath: 'assets/images/img_product_image_${index + 1}.png',
  //     // Đảm bảo rằng bạn có ảnh sản phẩm trong thư mục assets
  //     price: 100.0 + (index * 10),
  //     // Giá gốc tăng dần
  //     salePrice: 50.0 + (index * 10), // Giá sale tăng dần
  //   );
  // });
  List<Product> fakeFlashSaleProducts = [
    Product(
        id: "1",
        name: "iPhone 15",
        imagePath: "assets/images/iphone_15.png",
        price: 1200.00,
        salePrice: 1000.00,
        discountPercentage: 16.67,
        rating: 4.5,
        details: {
          'Description': "The latest iPhone with cutting-edge technology.",
          'Brand': 'Apple',
          'Sale': '16.67%',
          'Warranty':'1 năm',
          'Color': 'Bạc',
        }
    ),

    Product(
        id: "2",
        name: "Samsung S20",
        imagePath: "assets/images/samsung_s20.jpg",
        price: 1000.00,
        salePrice: 800.00,
        discountPercentage: 20,
        rating: 4.5,
        details: {
          'Description': "High-quality smartphone from Samsung with advanced features.",
          'Brand': 'Samsung',
          'Sale': '20%',
          'Warranty':'1 năm',
          'Color': 'Đen',
        }
    ),

    Product(
        id: "3",
        name: "Gà Rán KFC",
        imagePath: "assets/images/kfc_chicken.jpg",
        price: 10.00,
        salePrice: 8.00,
        discountPercentage: 20,
        rating: 4.5,
        details: {
          'Description': "Crispy and juicy KFC fried chicken.",
          'Brand': 'KFC',
          'Sale': '20%',
          'Warranty':'Không áp dụng',
          'Color': 'Vàng',
        }
    ),

    Product(
        id: "4",
        name: "Túi Gucci Small GG Supreme",
        imagePath: "assets/images/gucci_bag.jpeg",
        price: 1500.00,
        salePrice: 1200.00,
        discountPercentage: 20,
        rating: 4.5,
        details: {
          'Description': "Luxurious and stylish Gucci crossbody bag.",
          'Brand': 'Gucci',
          'Sale': '20%',
          'Warranty':'1 năm',
          'Color': 'Nâu',
        }
    ),

    Product(
        id: "5",
        name: "Tạp Dề",
        imagePath: "assets/images/apron.jpg",
        price: 20.00,
        salePrice: 15.00,
        discountPercentage: 25,
        rating: 4.5,
        details: {
          'Description': "Durable and comfortable apron for kitchen use.",
          'Brand': 'Generic',
          'Sale': '25%',
          'Warranty':'6 tháng',
          'Color': 'Xanh',
        }
    ),
  ];

  List<Product> fakeMegaSaleProducts = [
    Product(
        id: "6",
        name: "Tivi LG",
        imagePath: "assets/images/lg_tv.png",
        price: 1500.00,
        salePrice: 750.00,
        discountPercentage: 50,
        rating: 4.5,
        details: {
          'Description': "Smart TV with ultra high-definition picture quality.",
          'Brand': 'LG',
          'Sale': '50%',
          'Warranty':'1 năm',
          'Color': 'Đen',
        }
    ),

    Product(
        id: "7",
        name: "Giày Da",
        imagePath: "assets/images/leather_shoes.jpeg",
        price: 200.00,
        salePrice: 100.00,
        discountPercentage: 50,
        rating: 4.5,
        details: {
          'Description': "Elegant leather shoes for formal occasions.",
          'Brand': 'Generic',
          'Sale': '50%',
          'Warranty':'6 tháng',
          'Color': 'Nâu',
        }
    ),

    Product(
        id: "8",
        name: "Áo MLB",
        imagePath: "assets/images/mlb_jersey.jpg",
        price: 120.00,
        salePrice: 60.00,
        discountPercentage: 50,
        rating: 4.5,
        details: {
          'Description': "Official MLB jersey for baseball fans.",
          'Brand': 'MLB',
          'Sale': '50%',
          'Warranty':'6 tháng',
          'Color': 'Xanh lá',
        }
    ),

    Product(
        id: "9",
        name: "Dao Thái Thịt",
        imagePath: "assets/images/meat_knife.png",
        price: 50.00,
        salePrice: 25.00,
        discountPercentage: 50,
        rating: 4.5,
        details: {
          'Description': "Sharp and durable knife for efficient meat cutting.",
          'Brand': 'Generic',
          'Sale': '50%',
          'Warranty':'6 tháng',
          'Color': 'Bạc',
        }
    ),

    Product(
      id: "10",
      name: "Tủ Lạnh Panasonic",
      imagePath: "assets/images/panasonic_fridge.jpg", // Giả định đường dẫn hình ảnh
      price: 1000.00,
      salePrice: 500.00, // Giảm giá 50%
        discountPercentage: 50,
        rating: 4.5,
        details: {
        'Description': "High-capacity and energy-efficient refrigerator.",
        'Brand': 'Panasonic',
        'Sale': '50%',
        'Warranty':'1 năm',
        'Color': 'Xám',
      }
    ),
  ];

  List<Product> fakeGridViewProducts = [
    Product(
      id: '1',
      name: 'Son dưỡng',
      imagePath: 'assets/images/lip_balm.png',
      price: 300.0,
      salePrice: 150.0,
      discountPercentage: 50,
      rating: 4,
      details: {
        'Brand': 'ChapStick',
        'Color': 'Transparent',
        'Description': 'Son dưỡng môi giữ ẩm, bảo vệ môi khỏi thời tiết khô hanh',
        'Warranty': 'Không hỗ trợ',
        'Sale': '50%',
        'Ingredients': 'Wax, Oil, Fragrance'
      },
    ),
    Product(
      id: '2',
      name: 'Chổi lau nhà',
      imagePath: 'assets/images/mop.png',
      price: 200.0,
      salePrice: 100.0,
      discountPercentage: 50,
      rating: 4.5,
      details: {
        'Material': 'Microfiber',
        'Description': 'Chổi lau nhà microfiber, dễ dàng vệ sinh và lau sạch',
        'Warranty': '3 months',
        'Sale': '50%',
        'Features': 'Có thể giặt máy'
      },
    ),
    Product(
      id: '3',
      name: 'Bánh bao',
      imagePath: 'assets/images/steamed_bun.jpg',
      price: 50.0,
      salePrice: 25.0,
      discountPercentage: 50,
      rating: 1,
      details: {
        'Flavor': 'Thịt heo',
        'Description': 'Bánh bao nhân thịt heo thơm ngon, đậm đà',
        'Warranty': 'N/A',
        'Sale': '50%',
        'Nutrition': 'Carbs, Protein, Fat'
      },
    ),
    Product(
      id: '4',
      name: 'PS5',
      imagePath: 'assets/images/ps5.jpg',
      price: 10000.0,
      salePrice: 5000.0,
      discountPercentage: 50,
      rating: 4.5,
      details: {
        'Brand': 'Sony',
        'Description': 'Hệ máy PS5 mới nhất, trải nghiệm gaming ấn tượng',
        'Warranty': '1 year',
        'Sale': '50%',
        'Features': '8K, Ray Tracing, SSD ultra-fast'
      },
    ),
  ];
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
            text: "Tìm kiếm sản phẩm",
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
              flashSale: "Danh mục",
              seeMoreLink: "Tất cả danh mục", onTapSeeMoreLink: () {
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
    // return SizedBox(
    //   height: 238.v,
    //   child: ListView.separated(
    //     scrollDirection: Axis.horizontal,
    //     separatorBuilder: (context, index) => SizedBox(width: 16.h),
    //     itemCount: fakeProducts.length,
    //     itemBuilder: (context, index) {
    //       return FlashsaleItemWidget(product: fakeProducts[index]);
    //     },
    //   ),
    // );
    return SizedBox(
      height: 238.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.h),
        itemCount: 5,
        itemBuilder: (context, index) {
          return FlashsaleItemWidget(product: fakeFlashSaleProducts[index]);
        },
      ),
    );
  }


  /// Section Widget
  Widget _buildFlashSale1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: _buildFlashSaleHeader(context,
              flashSale: "Giảm giá",
              seeMoreLink: "Tất cả",
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
    // return SizedBox(
    //     height: 238.v,
    //     child: ListView.separated(
    //         scrollDirection: Axis.horizontal,
    //         separatorBuilder: (context, index) {
    //           return SizedBox(width: 16.h);
    //         },
    //         itemCount: 3,
    //         itemBuilder: (context, index) {
    //           return MegasaleItemWidget(product: megaSaleProducts[index]);
    //         }));
    return SizedBox(
      height: 238.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.h),
        itemCount: 5, // Số lượng sản phẩm mega sale fake
        itemBuilder: (context, index) {
          // Trả về MegasaleItemWidget với sản phẩm mega sale fake tương ứng
          return MegasaleItemWidget(product: fakeMegaSaleProducts[index]);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMegaSale1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: _buildFlashSaleHeader(context,
              flashSale: "Giảm siêu sốc", seeMoreLink: "Tất cả")),
      SizedBox(height: 10.v),
      _buildMegaSale(context)
    ]);
  }

  /// Section Widget
  Widget _buildProducts(BuildContext context) {
    // return Align(
    //     alignment: Alignment.centerLeft,
    //     child: Padding(
    //         padding: EdgeInsets.only(right: 16.h),
    //         child: GridView.builder(
    //             shrinkWrap: true,
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 mainAxisExtent: 283.v,
    //                 crossAxisCount: 2,
    //                 mainAxisSpacing: 13.h,
    //                 crossAxisSpacing: 13.h),
    //             physics: NeverScrollableScrollPhysics(),
    //             itemCount: 4,
    //             itemBuilder: (context, index) {
    //               return ProductsItemWidget(product: gridProducts[index]);
    //             })));
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
            crossAxisSpacing: 13.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ProductsItemWidget(product: fakeGridViewProducts[index]);
          },
        ),
      ),
    );
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
