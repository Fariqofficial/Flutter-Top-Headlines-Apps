import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/presentation/detail_news/controller/detail_news_controller.dart';
import 'package:news_indo_app/features/widgets/error_screen.dart';
import 'package:news_indo_app/features/widgets/loading.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

part 'widgets/content.dart';

class DetailNewsScreen extends StatelessWidget {
  final String url;
  const DetailNewsScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final DetailNewsController controller = Get.find<DetailNewsController>();
    controller.getDetailArticle(url);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Detail Article',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) return DetailLoading();
              if (controller.errorMessage.value.isNotEmpty) {
                return ErrorScreen(
                  title: controller.errorMessage.value,
                  isShowButton: true,
                  onTap: () => controller.getDetailArticle(url),
                );
              }
              if (controller.articles.value == null) {
                return ErrorScreen(title: "Article Not Found");
              }
              return _Content(article: controller.articles.value!);
            }),
          ],
          // children: [_Content()],
        ),
      ),
    );
  }
}
