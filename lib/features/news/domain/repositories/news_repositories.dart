import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/domain/entities/news.dart';

abstract class NewsRepositories {
  Future<Either<Failure, News>> getTopHeadlines();
  Future<Either<Failure, Article>> getArticleDetail(String url);
}
