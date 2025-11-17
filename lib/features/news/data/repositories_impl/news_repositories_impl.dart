import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/exceptions.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/core/network/network_info.dart';
import 'package:news_indo_app/features/news/data/datasource/news_remote_datasource.dart';
import 'package:news_indo_app/features/news/data/datasource/news_remote_datasource_local.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';
import 'package:news_indo_app/features/news/domain/entities/news.dart';
import 'package:news_indo_app/features/news/domain/repositories/news_repositories.dart';

class NewsRepositoriesImpl implements NewsRepositories {
  final NetworkInfo _networkInfo;
  final NewsRemoteDatasource _datasource;
  final NewsRemoteDatasourceLocal _datasourceLocal;
  const NewsRepositoriesImpl(
    this._networkInfo,
    this._datasource,
    this._datasourceLocal,
  );
  @override
  Future<Either<Failure, Article>> getArticleDetail(String url) async {
    final bool online = await _networkInfo.isConnected();
    if (online) {
      try {
        final result = await _datasource.getDetail(url);
        return Right(result.toEntity);
      } on TimeoutException {
        return Left(NotFoundFailure(message: "Request Timeout / No Response"));
      } on NotFoundException {
        return Left(NotFoundFailure(message: "Data Not Found"));
      } on ServerException {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final article = await _datasourceLocal.getArticleByUrl(url);
        return Right(article.toEntity);
      } on CachedException {
        return Left(CachedFailure(message: "Data can't show"));
      } on NotFoundException {
        return Left(NotFoundFailure(message: "Article not found in cache"));
      }
    }
  }

  @override
  Future<Either<Failure, News>> getTopHeadlines() async {
    final bool online = await _networkInfo.isConnected();
    if (online) {
      try {
        final remoteNews = await _datasource.getTopHeadlines();
        await _datasourceLocal.cacheNews(remoteNews);
        return Right(remoteNews.toEntity);
      } on TimeoutException {
        log('TimeoutException');
        return Left(NotFoundFailure(message: "Request Timeout / No Response"));
      } on NotFoundException {
        log('NotFoundException');
        return Left(NotFoundFailure(message: "Data Not Found"));
      } on ServerException {
        log('ServerException');
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final localArticles = await _datasourceLocal.getCachedArticles();
        return Right(
          News(
            status: 'ok',
            totalResults: localArticles.length,
            articles: localArticles.map((a) => a.toEntity).toList(),
          ),
        );
      } on CachedException {
        return Left(CachedFailure(message: "Data can't show"));
      }
    }
  }
}
