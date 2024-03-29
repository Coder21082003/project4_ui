import '../order_details_screen/widgets/product_item_widget.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_elevated_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 27.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.h, right: 15.h, bottom: 5.v),
                              child: Column(children: [
                                _buildPacking(context),
                                SizedBox(height: 24.v),
                                _buildProduct(context),
                                SizedBox(height: 24.v),
                                _buildShippingDetails(context),
                                SizedBox(height: 46.v),
                                _buildPaymentDetails(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildNotifyMe(context)));
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
            text: "Order Details", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildPacking(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 57.v, width: 51.h),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicWidth(
                  child: AnotherStepper(
                      iconHeight: 57,
                      iconWidth: 51,
                      stepperDirection: Axis.horizontal,
                      activeIndex: 0,
                      barThickness: 1,
                      inverted: true,
                      stepperList: [
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child:
                              Text("Packing", style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child: Text("Shipping",
                              style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child: Text("Arriving",
                              style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCheckmarkBlue50,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(left: 13.h)),
                          Padding(
                              padding: EdgeInsets.only(top: 13.v),
                              child: Text("Success",
                                  style: theme.textTheme.bodySmall))
                        ]))
                  ]))),
          SizedBox(height: 57.v, width: 49.h),
          Spacer(),
          SizedBox(height: 55.v, width: 53.h)
        ]));
  }

  /// Section Widget
  Widget _buildProduct(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("Product", style: theme.textTheme.titleSmall)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.v);
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return ProductItemWidget();
              }))
    ]);
  }

  /// Section Widget
  Widget _buildShippingDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("Shipping Details", style: theme.textTheme.titleSmall)),
      SizedBox(height: 11.v),
      Container(
          margin: EdgeInsets.only(left: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 11.v),
          decoration: AppDecoration.outlineBlue
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 6.v),
                _buildShipping(context,
                    shipping: "Date Shipping", pOSReggular: "January 16, 2020"),
                SizedBox(height: 15.v),
                _buildShipping(context,
                    shipping: "Shipping", pOSReggular: "POS Reggular"),
                SizedBox(height: 14.v),
                _buildShipping(context,
                    shipping: "No. Resi", pOSReggular: "000192848573"),
                SizedBox(height: 15.v),
                _buildShipping(context,
                    shipping: "Address",
                    pOSReggular: "2727 New  Owerri, Owerri, Imo State 78410")
              ]))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child:
                  Text("Payment Details", style: theme.textTheme.titleSmall)),
          SizedBox(height: 11.v),
          Container(
              padding: EdgeInsets.all(15.h),
              decoration: AppDecoration.outlineBlue
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildShipping1(context,
                        shipping: "Items (3)", price: "598.86"),
                    SizedBox(height: 16.v),
                    _buildShipping1(context,
                        shipping: "Shipping", price: "40.00"),
                    SizedBox(height: 14.v),
                    _buildShipping1(context,
                        shipping: "Import charges", price: "128.00"),
                    SizedBox(height: 12.v),
                    Divider(),
                    SizedBox(height: 10.v),
                    _buildShipping1(context,
                        shipping: "Total Price", price: "766.86")
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildNotifyMe(BuildContext context) {
    return CustomElevatedButton(
        text: "Notify Me",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Common widget
  Widget _buildShipping(
    BuildContext context, {
    required String shipping,
    required String pOSReggular,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.5,
          child: Text(shipping,
              style: CustomTextStyles.bodySmallOnPrimary_1
                  .copyWith(color: theme.colorScheme.onPrimary))),
      Text(pOSReggular,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Common widget
  Widget _buildShipping1(
    BuildContext context, {
    required String shipping,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shipping,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(price,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
