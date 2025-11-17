import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/exceptions.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/core/network/network_info.dart';
import 'package:news_indo_app/features/guest/data/datasource/user_remote_datasource.dart';
import 'package:news_indo_app/features/guest/data/datasource/user_remote_datasource_local.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';
import 'package:news_indo_app/features/guest/domain/repositories/user_repositories.dart';

class UserRepositoriesImpl implements UserRepositories {
  final NetworkInfo _networkInfo;
  final UserRemoteDatasource _remoteDataSource;
  final UserRemoteDatasourceLocal _localDataSource;

  const UserRepositoriesImpl(
    this._networkInfo,
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      final user = await _remoteDataSource.getCurrentUser();
      return Right(user);
    } on Exception {
      try {
        final cachedUser = await _localDataSource.getCachedUser();
        return Right(cachedUser);
      } on CachedException {
        return Right(null);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.signOut();
      await _localDataSource.clearCache();
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    final bool online = await _networkInfo.isConnected();
    if (online) {
      try {
        final user = await _remoteDataSource.signInWithGoogle();
        await _localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final cachedUser = await _localDataSource.getCachedUser();
        return Right(cachedUser);
      } on CachedException {
        return Left(CachedFailure(message: "No cached user"));
      }
    }
  }
}
