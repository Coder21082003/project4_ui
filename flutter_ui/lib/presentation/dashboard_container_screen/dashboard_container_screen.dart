import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/presentation/account_page/account_page.dart';
import 'package:flutter_ui/presentation/cart_page/cart_page.dart';
import 'package:flutter_ui/presentation/category_page/all_categories_page.dart';
import 'package:flutter_ui/presentation/category_page/appliances_page.dart';
import 'package:flutter_ui/presentation/category_page/electronics_page.dart';
import 'package:flutter_ui/presentation/category_page/entertainment_page.dart';
import 'package:flutter_ui/presentation/category_page/fashion_page.dart';
import 'package:flutter_ui/presentation/category_page/food_page.dart';
import 'package:flutter_ui/presentation/category_page/kitchen_page.dart';
import 'package:flutter_ui/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter_ui/presentation/explore_page/explore_page.dart';
import 'package:flutter_ui/presentation/offer_screen_page/offer_screen_page.dart';
import 'package:flutter_ui/presentation/super_flash_sale_screen/flash_sale_list_page.dart';
import 'package:flutter_ui/presentation/super_flash_sale_screen/super_flash_sale_screen.dart';
import 'package:flutter_ui/widgets/custom_bottom_bar.dart';



// ignore_for_file: must_be_immutable
class DashboardContainerScreen extends StatelessWidget {
  DashboardContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.dashboardPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Explore:
        return AppRoutes.explorePage;
      case BottomBarEnum.Cart:
        return AppRoutes.cartPage;
      case BottomBarEnum.Offer:
        return AppRoutes.offerScreenPage;
      case BottomBarEnum.Account:
        return AppRoutes.accountPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      case AppRoutes.explorePage:
        return ExplorePage();
      case AppRoutes.cartPage:
        return CartPage();
      case AppRoutes.offerScreenPage:
        return OfferScreenPage();
      case AppRoutes.accountPage:
        return AccountPage();
      case AppRoutes.allCategories:
        return AllCategoriesPage();
      case AppRoutes.kitchen:
        return KitchenPage();
      case AppRoutes.appliances:
        return AppliancesPage();
      case AppRoutes.entertainment:
        return EntertainmentPage();
      case AppRoutes.food:
        return FoodPage();
      case AppRoutes.fashion:
        return FashionPage();
      case AppRoutes.electronics:
        return ElectronicsPage();
      case AppRoutes.superFlashSaleScreen:
        return SuperFlashSaleScreen();
      case AppRoutes.flashSaleListPage:
        return FlashSaleListPage();
      default:
        return DefaultWidget();
    }
  }
}
