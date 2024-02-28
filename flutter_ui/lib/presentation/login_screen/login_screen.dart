import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  //Tạo hai TextEditingControllers để quản lý text trong các TextFormField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //GlobalKey để quản lý state của Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get http => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, //Tránh thay đổi kích thước khi bàn phím xuất hiện
        body: SizedBox(
          width: SizeUtils.width, // Sử dụng SizeUtils để quản lý kích thước
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom), //Padding để tránh bàn phím
            child: Form(
              key: _formKey, // Sử dụng _formKey cho Form
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 16.h, top: 200.v, right: 16.h),
                child: Column(
                  children: [
                    _buildPageHeader(context), //Xây dựng header của trang
                    SizedBox(height: 28.v),
                    //Tạo CustomTextFormField cho email
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Your Email",
                      textInputType: TextInputType.emailAddress,
                      //Các thuộc tính của CustomTextFormField
                    ),
                    SizedBox(height: 10.v),
                    //Tạo CustomTextFormField cho password
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true, //Che mật khẩu
                      //Các thuộc tính khác của CustomTextFormField
                    ),
                    SizedBox(height: 16.v),
                    // Tạo nút đăng nhập
                    CustomElevatedButton(
                      text: "Sign In",
                      onPressed: () {
                        onTapSignIn(context); //Xử lý khi nhấn "Sign In"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 18.v),
                    //Liên kết để điều hướng tới trang Forgot Password
                    GestureDetector(
                      onTap: () {
                        onTapForgotPassword(context); //Xử lý khi nhấn "Forgot Password?"
                      },
                      child: Text(
                        "Forgot Password?",
                        style: CustomTextStyles.labelLargePrimary,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    //RichText để hiển thị liên kết đăng ký
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: theme.textTheme.bodySmall,
                        ),
                        TextSpan(text: " "),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.inputEmailScreen);
                            },
                            child: Text(
                              "Register",
                              style: CustomTextStyles.labelLargePrimary_1,
                            ),
                          ),
                        ),
                      ]),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 17.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Xây dựng phần header của trang đăng nhập
  Widget _buildPageHeader(BuildContext context) {
    return Column(
      children: [
        //CustomImageView là widget để hiển thị hình ảnh
        CustomImageView(
          imagePath: ImageConstant.imgLogo,
          height: 70.adaptSize,
          width: 380.adaptSize,
        ),
        SizedBox(height: 16.v),
        // Text hiển thị tiêu đề
        Text("Welcome to E-com", style: theme.textTheme.titleMedium),
        SizedBox(height: 10.v),
        // Text hiển thị thông điệp phụ
        Text("Sign in to continue", style: theme.textTheme.bodySmall),
      ],
    );
  }

  //Hàm xử lý sự kiện nhấn nút Sign In
  void onTapSignIn(BuildContext context) async {
    // final String apiUrl = "http://150.95.109.25:9023/apij/v1/users/login";
    //
    // // Lấy dữ liệu từ TextEditingControllers
    // String username = emailController.text;
    // String password = passwordController.text;
    //
    // // Tạo body cho request
    // Map<String, String> body = {
    //   "username": username,
    //   "password": password,
    // };
    //
    // // Thực hiện POST request
    // final response = await http.post(Uri.parse(apiUrl), body: body);
    //
    // // Kiểm tra xem request có thành công không
    // if (response.statusCode == 200) {
    //   // Xử lý dữ liệu khi đăng nhập thành công
    //   // Ví dụ: lưu token vào biến global, điều hướng đến trang chính, v.v.
    //   print("Login success");
    //   Navigator.pushNamed(context, AppRoutes.registerScreen);
    // } else {
    //   // Xử lý khi đăng nhập thất bại, ví dụ hiển thị thông báo lỗi
    //   print("Login failed");
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("Login failed. Please check your credentials."),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );
    // }
    Navigator.pushNamed(context, AppRoutes.dashboardContainerScreen);
  }


  //Hàm xử lý sự kiện nhấn "Forgot Password?"
  void onTapForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enterVerifyEmailPage);
  }
}

// Widget nút đặc biệt
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: style,
      ),
    );
  }
}

//Mã trên cung cấp một giao diện đăng nhập đơn giản với các tính năng như nhập email, mật khẩu, và điều hướng đến các trang khác.
//CustomTextFormField và CustomElevatedButton là các widget được tùy chỉnh để phù hợp với thiết kế của ứng dụng.
//SafeArea đảm bảo rằng nội dung không bị che khuất bởi các yếu tố như notch hoặc status bar.
//SingleChildScrollView cho phép người dùng cuộn nếu nội dung không vừa với màn hình.
