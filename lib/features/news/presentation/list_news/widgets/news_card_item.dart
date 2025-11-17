part of '../list_news_screen.dart';

class _NewsCardItem extends StatelessWidget {
  final Article article;
  const _NewsCardItem({required this.article});

  String _formatTime(DateTime publishedAt) {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.newsDetail, arguments: article.url),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage!,
                  width: double.infinity,
                  height: 150.h,
                  fadeInDuration: const Duration(milliseconds: 300),
                  placeholder: (context, url) => Shimmer(
                    duration: const Duration(seconds: 2),
                    interval: const Duration(milliseconds: 300),
                    color: Colors.grey.shade300,
                    colorOpacity: 0.3,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: SizedBox(width: double.infinity, height: 150.h),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: double.infinity,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    color: Colors.grey.shade100,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              4.verticalSpace,
            ] else
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            4.verticalSpace,
            Text(
              article.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            2.verticalSpace,
            Wrap(
              spacing: 4.w,
              runSpacing: 4.h,
              children: [
                Icon(Icons.person, size: 20, color: const Color(0xFF4E4B66)),
                Text(
                  article.author != null
                      ? article.author!
                      : article.source.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff4E4B66),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                12.horizontalSpace,
                Icon(
                  Icons.access_time_outlined,
                  size: 20,
                  color: const Color(0xFF4E4B66),
                ),
                Text(
                  _formatTime(article.publishedAt),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff4E4B66),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
