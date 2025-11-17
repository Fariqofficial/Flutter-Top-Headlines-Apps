import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/features/guest/presentation/login/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'IMPERIAL ARTICLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                30.verticalSpace,
                ElevatedButton.icon(
                  onPressed: controller.signInWithGoogle,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Image.asset(
                      'assets/icons/google-icon.png',
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                  label: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[400],
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ), // Rounded corner
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
