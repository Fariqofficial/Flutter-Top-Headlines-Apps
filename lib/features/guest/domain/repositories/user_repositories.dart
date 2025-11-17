import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';

abstract class UserRepositories {
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel?>> getCurrentUser();
}
