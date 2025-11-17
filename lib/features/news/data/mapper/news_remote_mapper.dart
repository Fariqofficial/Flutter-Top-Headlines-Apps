import 'package:news_indo_app/features/news/data/mapper/article_remote_mapper.dart';
import 'package:news_indo_app/features/news/domain/entities/news.dart';

class NewsRemoteMapper extends News {
  const NewsRemoteMapper({
    required super.status,
    required super.totalResults,
    required super.articles,
  });

  factory NewsRemoteMapper.fromJSON(Map<String, dynamic> json) {
    return NewsRemoteMapper(
      status: json['status'],
      totalResults: json['totalResults'],
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((article) => ArticleRemoteMapper.fromJSON(article))
              .toList() ??
          [],
    );
  }

  News get toEntity => News(
    status: status,
    totalResults: totalResults,
    articles: articles.map((a) => (a as ArticleRemoteMapper).toEntity).toList(),
  );
}
