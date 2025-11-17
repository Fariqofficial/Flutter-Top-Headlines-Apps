import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/domain/repositories/news_repositories.dart';

class GetArticleDetail {
  final NewsRepositories _repo;
  const GetArticleDetail(this._repo);

  Future<Either<Failure, Article>> call(String url) =>
      _repo.getArticleDetail(url);
}
