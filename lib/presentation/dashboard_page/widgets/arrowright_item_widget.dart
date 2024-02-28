import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';

class ArrowrightItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const ArrowrightItemWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a standard text style for category names
    final TextStyle categoryTextStyle = TextStyle(
      fontWeight: FontWeight.bold, // Make the text bold
      fontSize: 12, // Choose an appropriate font size
      // You can also specify other properties like fontFamily, color, etc.
    );

    return SizedBox(
      width: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center column content vertically
          children: [
            Container(
              height: 70.adaptSize,
              width: 70.adaptSize,
              alignment: Alignment.center, // Ensure the icon is centered
              child: Icon(
                icon,
                size: 30, // Set an appropriate size for the icon
                // You can also specify the color if needed
              ),
            ),
            SizedBox(height: 7.v),
            Text(
              title,
              style: categoryTextStyle,
              textAlign: TextAlign.center, // Ensure the text is centered
            ),
          ],
        ),
      ),
    );
  }
}


