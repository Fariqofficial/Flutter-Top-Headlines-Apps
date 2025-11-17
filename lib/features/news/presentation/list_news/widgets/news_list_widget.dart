part of '../list_news_screen.dart';

class _NewsListWidget extends StatelessWidget {
  const _NewsListWidget();

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find<NewsController>();
    return Obx(() {
      if (controller.isLoading.value) ListLoading();
      if (controller.errorMessage.value.isNotEmpty) {
        ErrorScreen(
          title: controller.errorMessage.value,
          isShowButton: true,
          onTap: () => controller.fetchTopHeadlines(),
        );
      }
      if (controller.articles.isEmpty) {
        ErrorScreen(
          image: const AssetImage("assets/icons/empty-icon.png"),
          title: "Articles is empty",
        );
      }
      return RefreshIndicator(
        onRefresh: () async => controller.refresh(),
        child: ListView.builder(
          itemCount: controller.articles.length,
          padding: EdgeInsets.symmetric(vertical: 4.h),
          itemBuilder: (context, index) {
            return _NewsCardItem(article: controller.articles[index]);
          },
        ),
      );
    });
  }
}
