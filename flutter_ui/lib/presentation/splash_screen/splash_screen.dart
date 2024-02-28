import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'dart:async';

// Tạo một StatefulWidget, SplashScreen.
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// Định nghĩa trạng thái cho SplashScreen.
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Tạo một Timer để chuyển hướng đến màn hình khác sau 2 giây.
    Timer(Duration(seconds: 2), () {
      // Chuyển hướng tới trang đăng nhập sau khi thời gian chờ kết thúc.
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea để đảm bảo không gian hiển thị không bị che khuất.
      child: Scaffold(
        // Scaffold cung cấp cấu trúc cơ bản của một màn hình trong Flutter.
        body: Container(
          // Container làm nền cho toàn bộ màn hình.
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // BoxDecoration để tạo gradient cho nền.
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ],
            ),
          ),
          child: Column(
            // Column để sắp xếp các widget theo chiều dọc.
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              // CustomImageView để hiển thị logo.
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 72.adaptSize,
                width: 400.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mã trên cung cấp một màn hình splash đơn giản mà tự động chuyển hướng người dùng đến màn hình đăng nhập sau một khoảng thời gian cố định (ở đây là 2 giây).
// Timer được sử dụng để xử lý chuyển hướng sau thời gian chờ.
// SafeArea đảm bảo rằng nội dung của màn hình không bị che khuất bởi thanh trạng thái hoặc các yếu tố giao diện khác.
// CustomImageView là một widget tùy chỉnh để hiển thị hình ảnh, ở đây được sử dụng để hiển thị logo của ứng dụng.
