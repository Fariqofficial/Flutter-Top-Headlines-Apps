import 'package:dartz/dartz.dart';
import 'package:news_indo_app/core/error/failure.dart';
import 'package:news_indo_app/features/guest/domain/repositories/user_repositories.dart';

class SignOut {
  final UserRepositories _repo;
  const SignOut(this._repo);

  Future<Either<Failure, void>> call() => _repo.logout();
}
