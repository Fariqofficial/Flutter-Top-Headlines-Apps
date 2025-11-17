import 'package:equatable/equatable.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';

class News extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object?> get props => [status, totalResults, articles];
}
