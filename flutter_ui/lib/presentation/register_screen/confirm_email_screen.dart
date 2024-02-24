import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'dart:async';

class ConfirmEmailScreen extends StatefulWidget {
  final String email;

  ConfirmEmailScreen({required this.email});

  @override
  _ConfirmEmailScreenState createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  late List<String> pin;
  late int resendTimer;
  late bool isResendEnabled;

  @override
  void initState() {
    super.initState();
    pin = List.filled(6, ''); // List chứa 6 phần tử để lưu mã pin
    resendTimer = 90;
    isResendEnabled = false;
    startResendTimer();
  }

  void startResendTimer() {
    Future.delayed(Duration(seconds: resendTimer), () {
      setState(() {
        isResendEnabled = true;
      });
    });
  }

  void resendPin() {
    // Gửi lại mã pin về email ở đây
    // Đồng thời cập nhật trạng thái nút Resend
    setState(() {
      isResendEnabled = false;
      resendTimer = 10;
      startResendTimer();
    });
  }

  void submitPin() {
    // Kiểm tra mã pin và chuyển hướng đến trang đăng ký
    String enteredPin = pin.join();
    if (enteredPin.length == 6) {
      // Gửi mã pin đến server để kiểm tra (điều này tùy thuộc vào logic ứng dụng của bạn)
      // Nếu mã pin hợp lệ, chuyển hướng đến trang đăng ký
      Navigator.pushNamed(context, AppRoutes.registerScreen);
    } else {
      // Hiển thị thông báo lỗi nếu mã pin không đủ 6 ký tự
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid PIN'),
          content: Text('Please enter a 6-digit PIN.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the 6-digit PIN sent to ${widget.email}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                    (index) => PinInputField(
                  onChanged: (value) {
                    setState(() {
                      pin[index] = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isResendEnabled ? resendPin : null,
              child: Text('Resend PIN'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitPin,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class PinInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  PinInputField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
