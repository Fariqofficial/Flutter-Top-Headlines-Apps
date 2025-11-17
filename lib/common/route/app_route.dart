import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/features/guest/domain/usecase/get_current_user.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_in_with_google.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_out.dart';
import 'package:news_indo_app/features/guest/presentation/login/controller/login_controller.dart';
import 'package:news_indo_app/features/guest/presentation/login/login_screen.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_article_detail.dart';
import 'package:news_indo_app/features/news/domain/usecase/get_top_headline.dart';
import 'package:news_indo_app/features/news/presentation/detail_news/controller/detail_news_controller.dart';
import 'package:news_indo_app/features/news/presentation/detail_news/detail_news_screen.dart';
import 'package:news_indo_app/features/news/presentation/list_news/controller/news_controller.dart';
import 'package:news_indo_app/features/news/presentation/list_news/list_news_screen.dart';
import 'package:news_indo_app/injection.dart';

class AppRoute {
  static const String main = "/";
  static const String dashboard = '/news/list';
  static const String newsDetail = '/news/detail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(
          builder: (context) {
            Get.put(
              LoginController(
                di<SignInWithGoogle>(),
                di<GetCurrentUser>(),
                di<SignOut>(),
              ),
            );
            return LoginScreen();
          },
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (context) {
            Get.put(NewsController(di<GetTopHeadlines>()));
            return ListNewsScreen();
          },
        );
      case newsDetail:
        final String? url = settings.arguments as String?;
        if (url == null || url.isEmpty) return _notFoundPage;
        return MaterialPageRoute(
          builder: (context) {
            Get.put(DetailNewsController(di<GetArticleDetail>()));
            return DetailNewsScreen(url: url);
          },
        );
      default:
        return _notFoundPage;
    }
  }

  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
    builder: (context) => Scaffold(body: Center(child: Text("Page Not Found"))),
  );
}
