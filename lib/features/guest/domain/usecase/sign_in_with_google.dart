import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';
import 'package:news_indo_app/features/guest/domain/repositories/user_repositories.dart';

class SignInWithGoogle {
  final UserRepositories _repo;
  const SignInWithGoogle(this._repo);

  Future<Either<Failure, UserModel>> call() => _repo.signInWithGoogle();
}
