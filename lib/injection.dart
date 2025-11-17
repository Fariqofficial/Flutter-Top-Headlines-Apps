import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:news_indo_app/core/network/network_info.dart';
import 'package:news_indo_app/features/guest/data/datasource/user_remote_datasource.dart';
import 'package:news_indo_app/features/guest/data/datasource/user_remote_datasource_local.dart';
import 'package:news_indo_app/features/guest/data/repositories_impl/user_repositories_impl.dart';
import 'package:news_indo_app/features/guest/domain/repositories/user_repositories.dart';
import 'package:news_indo_app/features/guest/domain/usecase/get_current_user.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_in_with_google.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_out.dart';
import 'package:news_indo_app/features/news/data/datasource/news_remote_datasource.dart';
import 'package:news_indo_app/features/news/data/datasource/news_remote_datasource_local.dart';
import 'package:news_indo_app/features/news/data/repositories_impl/news_repositories_impl.dart';
import 'package:news_indo_app/features/news/domain/repositories/news_repositories.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_article_detail.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_top_headline.dart';

final di = GetIt.instance;

Future<void> configureInjection() async {
  di.registerLazySingleton(() => http.Client());

  di.registerLazySingleton(() => Connectivity());
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  di.registerLazySingleton<NewsRemoteDatasource>(
    () => NewsRemoteDatasourceImpl(di()),
  );
  di.registerLazySingleton<NewsRemoteDatasourceLocal>(
    () => NewsRemoteDatasourceLocalImpl(),
  );
  di.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  di.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  di.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl(di(), di()),
  );
  di.registerLazySingleton<UserRemoteDatasourceLocal>(
    () => UserRemoteDatasourceLocalImpl(),
  );

  di.registerLazySingleton<NewsRepositories>(
    () => NewsRepositoriesImpl(di(), di(), di()),
  );
  di.registerLazySingleton<UserRepositories>(
    () => UserRepositoriesImpl(di(), di(), di()),
  );

  di.registerLazySingleton(() => GetTopHeadlines(di()));
  di.registerLazySingleton(() => GetArticleDetail(di()));
  di.registerLazySingleton(() => SignInWithGoogle(di()));
  di.registerLazySingleton(() => GetCurrentUser(di()));
  di.registerLazySingleton(() => SignOut(di()));
}
