import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';


class InputEmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kiểm tra xem email có hợp lệ không
                String email = emailController.text.trim();
                if (isValidEmail(email)) {
                  // Chuyển hướng đến trang confirm_email_screen.dart
                  Navigator.pushNamed(
                    context,
                    AppRoutes.confirmEmailScreen,
                    arguments: {'email': email},
                  );
                } else {
                  // Hiển thị thông báo lỗi nếu email không hợp lệ
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Invalid Email'),
                      content: Text('Please enter a valid email address.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: Size(200,50),
              )
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Kiểm tra xem email có đúng định dạng không
    // Bạn có thể sử dụng các biểu thức chính quy hoặc thư viện kiểm tra email
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
  }
}
