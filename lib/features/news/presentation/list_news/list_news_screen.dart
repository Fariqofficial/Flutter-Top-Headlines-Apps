import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/common/route/app_route.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/presentation/list_news/controller/news_controller.dart';
import 'package:news_indo_app/features/widgets/error_screen.dart';
import 'package:news_indo_app/features/widgets/loading.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

part 'widgets/news_list_widget.dart';
part 'widgets/news_card_item.dart';

class ListNewsScreen extends StatelessWidget {
  final NewsController controller = Get.find<NewsController>();
  ListNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Imperial Articles',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TOP HEADLINES",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            4.verticalSpace,
            Expanded(child: _NewsListWidget()),
          ],
        ),
      ),
    );
  }
}
