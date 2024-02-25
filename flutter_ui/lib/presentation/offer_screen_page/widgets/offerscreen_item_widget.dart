import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/app_export.dart';
import 'package:intl/intl.dart';

class OfferscreenItemWidget extends StatefulWidget {
  const OfferscreenItemWidget({Key? key}) : super(key: key);

  @override
  _OfferscreenItemWidgetState createState() => _OfferscreenItemWidgetState();
}

class _OfferscreenItemWidgetState extends State<OfferscreenItemWidget> {
  late Timer _timer;
  late int countDown = 15 * 60; // 15 phút đổi thành giây
  late String formattedMinutes;
  late String formattedSeconds;

  @override
  void initState() {
    super.initState();
    updateDateTime();

    // Cập nhật thời gian sau mỗi giây
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      updateDateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void updateDateTime() {
    formattedMinutes = (countDown ~/ 60).toString().padLeft(2, '0');
    formattedSeconds = (countDown % 60).toString().padLeft(2, '0');
    
    if (countDown > 0) {
      countDown--;
    } else {
      // Đã hết thời gian, thực hiện hành động tương ứng
      // Ví dụ: Hiển thị thông báo, tắt widget, vv.
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 206.v,
      width: 343.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPromotionImage,
            height: 206.v,
            width: 343.h,
            radius: BorderRadius.circular(5.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 209.h,
                    child: Text(
                      "Siêu ưu đãi\nGiảm 50%",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineSmall!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 27.v),
                  Row(
                    children: [
                      Container(
                        width: 42.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 8.v,
                        ),
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          formattedMinutes,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.h,
                          top: 10.v,
                          bottom: 9.v,
                        ),
                        child: Text(
                          ":",
                          style:
                              CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                      Container(
                        width: 42.h,
                        margin: EdgeInsets.only(left: 4.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 8.v,
                        ),
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          formattedSeconds,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}