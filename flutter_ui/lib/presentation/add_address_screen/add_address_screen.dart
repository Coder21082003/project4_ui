import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_ui/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_ui/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_elevated_button.dart';
import 'package:flutter_ui/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  TextEditingController countryController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController streetaddressController = TextEditingController();

  TextEditingController streetaddressController1 = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController zipcodeController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h, right: 16.h, bottom: 5.v),
                                  child: Column(children: [
                                    _buildCountry(context),
                                    SizedBox(height: 22.v),
                                    _buildFirstName(context),
                                    SizedBox(height: 22.v),
                                    _buildLastName(context),
                                    SizedBox(height: 23.v),
                                    _buildStreetAddress(context),
                                    SizedBox(height: 21.v),
                                    // _buildStreetAddress2(context),
                                    // SizedBox(height: 22.v),
                                    // _buildCity(context),
                                    // SizedBox(height: 23.v),
                                    // _buildStateProvinceRegion(context),
                                    // SizedBox(height: 24.v),
                                    // _buildZipCode(context),
                                    // SizedBox(height: 23.v),
                                    _buildPhoneNumber(context)
                                  ]))))
                    ]))),
            bottomNavigationBar: _buildAddAddress(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Địa chỉ", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Tỉnh / thành phố", style: theme.textTheme.titleSmall),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: countryController,
          hintText: "Nhập tỉnh hoặc thành phố",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Quận / huyện", style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      CustomTextFormField(
          controller: firstNameController,
          hintText: "Nhập tên quận/huyện",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Xã / phường", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: lastNameController,
          hintText: "Nhập tên xã / phường",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildStreetAddress(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Số nhà", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: streetaddressController,
          hintText: "Nhập số nhà",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildStreetAddress2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Street Address 2 (Optional)", style: theme.textTheme.titleSmall),
      SizedBox(height: 16.v),
      CustomTextFormField(
          controller: streetaddressController1,
          hintText: "Enter the street address 2",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildCity(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("City", style: theme.textTheme.titleSmall),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: cityController,
          hintText: "Enter the city",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildStateProvinceRegion(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("State/Province/Region", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: oldPasswordController,
          hintText: "Enter the state/province/region",
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildZipCode(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Zip Code", style: theme.textTheme.titleSmall),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: zipcodeController,
          hintText: "Enter the zip code",
          textInputType: TextInputType.number,
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Số điện thoại", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: phoneNumberController,
          hintText: "Nhập số điện thoại",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.phone,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.h, vertical: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildAddAddress(BuildContext context) {
    return CustomElevatedButton(
        text: "Lưu địa chỉ",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accountPage);
  }
}
