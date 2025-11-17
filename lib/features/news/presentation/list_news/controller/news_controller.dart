import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_top_headline.dart';

class NewsController extends GetxController {
  final GetTopHeadlines _getTopHeadlines;
  NewsController(this._getTopHeadlines);

  final RxList<Article> articles = <Article>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopHeadlines();
  }

  Future<void> fetchTopHeadlines() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await _getTopHeadlines();
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
        articles.assignAll(data.articles);
      },
    );
  }

  @override
  void refresh() => fetchTopHeadlines();
}
