import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:flutter_ui/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Categories4ItemWidget extends StatelessWidget {
  final String description;
  final String imgExploreItem;

  const Categories4ItemWidget({
    Key? key,
    required this.description,
    required this.imgExploreItem,
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      onTapNotThing(context);
    },
    child: Column(
      children: [
        Container(
          width: 70.adaptSize,
          height: 70.adaptSize,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0), // Điều chỉnh giá trị để có góc bo tròn
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imgExploreItem,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Expanded(
          child: Text(
            description,
            style: CustomTextStyles.labelMediumBluegray300,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
  //not build yet
  onTapNotThing(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Note",
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            "This fuction is not availble yet",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
