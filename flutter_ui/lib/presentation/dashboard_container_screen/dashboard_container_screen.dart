import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/presentation/account_page/account_page.dart';
import 'package:flutter_ui/presentation/add_address_screen/add_address_screen.dart';
import 'package:flutter_ui/presentation/add_payment_screen/add_payment_screen.dart';
import 'package:flutter_ui/presentation/address_screen/address_screen.dart';
import 'package:flutter_ui/presentation/cart_page/cart_page.dart';
import 'package:flutter_ui/presentation/category_page/all_categories_page.dart';
import 'package:flutter_ui/presentation/category_page/appliances_page.dart';
import 'package:flutter_ui/presentation/category_page/electronics_page.dart';
import 'package:flutter_ui/presentation/category_page/entertainment_page.dart';
import 'package:flutter_ui/presentation/category_page/fashion_page.dart';
import 'package:flutter_ui/presentation/category_page/food_page.dart';
import 'package:flutter_ui/presentation/category_page/kitchen_page.dart';
import 'package:flutter_ui/presentation/change_password_screen/change_password_screen.dart';
import 'package:flutter_ui/presentation/choose_credit_or_debit_card_screen/choose_credit_or_debit_card_screen.dart';
import 'package:flutter_ui/presentation/credit_card_and_debit_screen/credit_card_and_debit_screen.dart';
import 'package:flutter_ui/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter_ui/presentation/explore_page/explore_page.dart';
import 'package:flutter_ui/presentation/notification_activity_screen/notification_activity_screen.dart';
import 'package:flutter_ui/presentation/notification_feed_screen/notification_feed_screen.dart';
import 'package:flutter_ui/presentation/notification_offer_screen/notification_offer_screen.dart';
import 'package:flutter_ui/presentation/notification_screen/notification_screen.dart';
import 'package:flutter_ui/presentation/offer_screen_page/offer_screen_page.dart';
import 'package:flutter_ui/presentation/order_details_screen/order_details_screen.dart';
import 'package:flutter_ui/presentation/order_screen/order_screen.dart';
import 'package:flutter_ui/presentation/profile_screen/profile_screen.dart';
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
      case AppRoutes.profileScreen:
        return ProfileScreen();
      case AppRoutes.addPaymentScreen:
        return AddPaymentScreen();
      case AppRoutes.orderDetailsScreen:
        return OrderDetailsScreen();
      case AppRoutes.addressScreen:
        return AddressScreen();
      case AppRoutes.changePasswordScreen:
        return ChangePasswordScreen();
      case AppRoutes.creditCardAndDebitScreen:
        return CreditCardAndDebitScreen();
      case AppRoutes.chooseCreditOrDebitCardScreen:
        return ChooseCreditOrDebitCardScreen();
      case AppRoutes.notificationScreen:
        return NotificationScreen();
      case AppRoutes.notificationActivityScreen:
        return NotificationActivityScreen();
      case AppRoutes.notificationFeedScreen:
        return NotificationFeedScreen();
      case AppRoutes.notificationOfferScreen:
        return NotificationOfferScreen();
      case AppRoutes.addAddressScreen:
        return AddAddressScreen();
      case AppRoutes.orderScreen:
        return OrderScreen();
      case AppRoutes.orderDetailsScreen:
        return OrderDetailsScreen();
      default:
        return DefaultWidget();
    }
  }
}
