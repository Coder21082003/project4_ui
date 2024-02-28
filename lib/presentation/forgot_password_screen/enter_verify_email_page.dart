import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/forgot_password_screen/verify_code_page.dart';

class EnterVerifyEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quên Mật Khẩu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nhập username của bạn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic gửi yêu cầu đặt lại mật khẩu
                // Chuyển đến trang xác nhận
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyCodePage()),
                );
              },
              child: Text('Gửi Yêu Cầu'),
            ),
          ],
        ),
      ),
    );
  }
}
