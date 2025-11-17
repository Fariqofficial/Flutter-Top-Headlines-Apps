import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatelessWidget {
  final ImageProvider<Object>? image;
  final String? title;
  final String? subtitle;
  final bool isShowSubtitle;
  final bool isShowButton;
  final Function()? onTap;
  const ErrorScreen({
    super.key,
    this.image,
    this.title,
    this.subtitle,
    this.isShowSubtitle = false,
    this.isShowButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 180.w,
            height: 140.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image ?? AssetImage("assets/icons/error-icon.png"),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title ?? "Something went wrong",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        4.verticalSpace,
        isShowSubtitle
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  subtitle ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            : SizedBox.shrink(),
        4.verticalSpace,
        isShowButton
            ? GestureDetector(
                onTap: onTap ?? () {},
                child: Container(
                  width: 150.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.cyan[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
