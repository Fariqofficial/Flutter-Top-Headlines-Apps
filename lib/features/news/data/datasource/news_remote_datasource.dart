import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_indo_app/core/error/exceptions.dart';
import 'package:news_indo_app/features/news/data/mapper/article_remote_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:news_indo_app/features/news/data/mapper/news_remote_mapper.dart';

abstract class NewsRemoteDatasource {
  Future<NewsRemoteMapper> getTopHeadlines();
  Future<ArticleRemoteMapper> getDetail(String url);
}

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final http.Client _client;
  NewsRemoteDatasourceImpl(this._client);

  @override
  Future<NewsRemoteMapper> getTopHeadlines() async {
    final baseUrl = dotenv.env['BASE_URL'] ?? 'https://newsapi.org/v2';
    final apiKey = dotenv.env['API_KEY'] ?? '';

    if (apiKey.isEmpty) throw ServerException();

    final url = Uri.parse('$baseUrl//top-headlines?country=us&apiKey=$apiKey');
    final response = await _client.get(url).timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == 'ok') {
        return NewsRemoteMapper.fromJSON(json);
      } else {
        throw ServerException();
      }
    } else if (response.statusCode == 400) {
      throw ServerException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ArticleRemoteMapper> getDetail(String url) async {
    final news = await getTopHeadlines();
    try {
      final article =
          news.articles.firstWhere((a) => a.url == url) as ArticleRemoteMapper;
      return article;
    } catch (e) {
      throw NotFoundException();
    }
  }
}
