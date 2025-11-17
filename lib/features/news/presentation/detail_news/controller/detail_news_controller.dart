import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_article_detail.dart';

class DetailNewsController extends GetxController {
  final GetArticleDetail _getDetail;
  DetailNewsController(this._getDetail);

  final Rx<Article?> articles = Rx<Article?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final String url = Get.arguments as String? ?? '';
    if (url.isNotEmpty) getDetailArticle(url);
  }

  Future<void> getDetailArticle(String url) async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await _getDetail(url);
    result.fold(
      (failure) {
        isLoading.value = false;
        errorMessage.value = failure.message;
        Get.snackbar(
          'Error',
          errorMessage.value,
          icon: Icon(Icons.info_outline, size: 18, color: Colors.white),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      },
      (data) {
        isLoading.value = false;
        articles.value = data;
      },
    );
  }
}
