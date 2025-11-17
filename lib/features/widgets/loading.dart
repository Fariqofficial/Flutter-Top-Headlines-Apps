import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Shimmer(
              color: Colors.grey[600]!,
              duration: const Duration(seconds: 2),
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              interval: const Duration(milliseconds: 300),
              child: Container(height: 140.h),
            ),
          ),
          6.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Shimmer(
              color: Colors.grey[600]!,
              duration: const Duration(seconds: 2),
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              interval: const Duration(milliseconds: 300),
              child: SizedBox(width: 300.w, height: 10.h),
            ),
          ),
          4.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8.r),
            child: Shimmer(
              color: Colors.grey[600]!,
              duration: const Duration(seconds: 2),
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              interval: const Duration(milliseconds: 300),
              child: SizedBox(width: 250.w, height: 10.h),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Shimmer(
            color: Colors.grey[600]!,
            duration: const Duration(seconds: 2),
            enabled: true,
            direction: const ShimmerDirection.fromLTRB(),
            interval: const Duration(milliseconds: 300),
            child: Container(height: 150.h),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 8.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: 300.w, height: 10.h),
                ),
              ),
              4.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: 200.w, height: 10.h),
                ),
              ),
              10.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: double.infinity, height: 10.h),
                ),
              ),
              6.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: double.infinity, height: 10.h),
                ),
              ),
              6.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: double.infinity, height: 10.h),
                ),
              ),
              6.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: double.infinity, height: 10.h),
                ),
              ),
              4.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: double.infinity, height: 10.h),
                ),
              ),
              12.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.r),
                child: Shimmer(
                  color: Colors.grey[600]!,
                  duration: const Duration(seconds: 2),
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  interval: const Duration(milliseconds: 300),
                  child: SizedBox(width: 250.w, height: 10.h),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
