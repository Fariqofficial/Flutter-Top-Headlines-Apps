import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/news/domain/entities/news.dart';
import 'package:news_indo_app/features/news/domain/repositories/news_repositories.dart';

class GetTopHeadlines {
  final NewsRepositories _repo;
  const GetTopHeadlines(this._repo);

  Future<Either<Failure, News>> call() => _repo.getTopHeadlines();
}
