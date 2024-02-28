import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_text_form_field.dart';

// Định nghĩa một StatelessWidget, RegisterScreen.
class RegisterScreen extends StatelessWidget {
  // Khởi tạo các TextEditingControllers để quản lý nhập liệu từ người dùng.
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  // GlobalKey để quản lý trạng thái của Form.
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea để đảm bảo nội dung không bị che khuất bởi các yếu tố như notch hoặc status bar.
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Ngăn chặn thay đổi kích thước khi bàn phím xuất hiện.
        body: Center(
          child: SingleChildScrollView(
            // Cho phép cuộn nếu nội dung vượt quá kích thước màn hình.
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey, // Sử dụng GlobalKey cho Form.
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPageHeader(context), // Xây dựng header của trang.
                    SizedBox(height: 30.v),
                    _buildFullName(context), // Xây dựng trường nhập họ tên.
                    SizedBox(height: 8.v),
                    _buildEmail(context), // Xây dựng trường nhập email.
                    SizedBox(height: 8.v),
                    _buildPassword(context), // Xây dựng trường nhập mật khẩu.
                    SizedBox(height: 8.v),
                    _buildPassword1(context), // Xây dựng trường nhập lại mật khẩu.
                    SizedBox(height: 20.v),
                    _buildSignUp(context), // Xây dựng nút đăng ký.
                    SizedBox(height: 20.v),
                    _buildSignInLink(context), // Xây dựng liên kết đến trang đăng nhập.
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageHeader(BuildContext context) {
    // Xây dựng header của trang đăng ký với logo và tiêu đề.
    return Column(
      children: [
        // Sử dụng CustomImageView để hiển thị logo.
        CustomImageView(
          imagePath: ImageConstant.imgLogo,
          height: 72.adaptSize,
          width: 380.adaptSize,
        ),
        SizedBox(height: 16.v),
        // Text hiển thị tiêu đề "Let’s Get Started".
        Text("Let’s Get Started", style: theme.textTheme.titleMedium),
        SizedBox(height: 9.v),
        // Text hiển thị thông điệp phụ "Create an new account".
        Text("Create an new account", style: theme.textTheme.bodySmall)
      ],
    );
  }

  // Các hàm xây dựng các trường nhập liệu (họ tên, email, mật khẩu, nhập lại mật khẩu).
  // Ví dụ:
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
        controller: fullNameController,
        hintText: "Full Name",
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Your Email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgEmailIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
  }

  Widget _buildPassword1(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController1,
        hintText: "Password Again",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
  }

  Widget _buildSignUp(BuildContext context) {
    // Xây dựng nút đăng ký.
    return CustomElevatedButton(
      text: "Sign Up",
      onPressed: () {
        onTapSignUp(context); // Xử lý khi nhấn nút "Sign Up".
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Màu nền của nút.
        foregroundColor: Colors.white, // Màu chữ.
      ),
    );
  }

  void onTapSignUp(BuildContext context) {
    // Xử lý điều hướng khi nhấn "Sign Up".
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  // Hàm xây dựng liên kết "Sign In".
  Widget _buildSignInLink(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Have an account?",
            style: theme.textTheme.bodySmall),
        TextSpan(text: " "),
        WidgetSpan(
          child: InkWell(
            onTap: () => onTapSignIn(context),
            child: Text(
              "Sign In",
              style: CustomTextStyles.labelLargePrimary_1,
            ),
          ),
        ),
      ]),
      textAlign: TextAlign.left,
    );
  }

  void onTapSignIn(BuildContext context) {
    // Xử lý điều hướng khi nhấn "Sign In".
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}

class CustomElevatedButton extends StatelessWidget {
  // Định nghĩa một custom ElevatedButton widget.
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;

  CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Chiều rộng tối đa.
      height: 50, // Chiều cao cố định.
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: style,
      ),
    );
  }
}

// Trong mã này, RegisterScreen là một màn hình đăng ký cho phép người dùng nhập thông tin cá nhân như họ tên, email và mật khẩu.
// Màn hình sử dụng Form để quản lý nhập liệu và GlobalKey để quản lý trạng thái của form.
// Nút đăng ký và liên kết chuyển hướng đến trang đăng nhập được xử lý thông qua các hàm onTapSignUp và onTapSignIn.
// CustomElevatedButton là một widget nút được tùy chỉnh, cho phép bạn định nghĩa thêm các thuộc tính như màu sắc và hành động khi nhấn nút.