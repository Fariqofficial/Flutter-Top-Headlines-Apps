import 'dart:convert';

import 'package:news_indo_app/core/error/exceptions.dart';
import 'package:news_indo_app/features/news/data/mapper/article_remote_mapper.dart';
import 'package:news_indo_app/features/news/data/mapper/news_remote_mapper.dart';
import 'package:news_indo_app/features/news/data/mapper/source_remote_mapper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class NewsRemoteDatasourceLocal {
  Future<void> cacheNews(NewsRemoteMapper news);
  Future<List<ArticleRemoteMapper>> getCachedArticles();
  Future<ArticleRemoteMapper> getArticleByUrl(String url);
}

class NewsRemoteDatasourceLocalImpl implements NewsRemoteDatasourceLocal {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'news.db');

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE articles(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        source TEXT NOT NULL,
        author TEXT,
        title TEXT NOT NULL,
        description TEXT,
        url TEXT NOT NULL UNIQUE,
        urlToImage TEXT,
        publishedAt TEXT NOT NULL,
        content TEXT
      )
    ''');
  }

  Map<String, dynamic> _articleToMap(ArticleRemoteMapper article) {
    return {
      'source': jsonEncode((article.source as SourceRemoteMapper).toJSON()),
      'author': article.author,
      'title': article.title,
      'description': article.description,
      'url': article.url,
      'urlToImage': article.urlToImage,
      'publishedAt': article.publishedAt.toIso8601String(),
      'content': article.content,
    };
  }

  ArticleRemoteMapper _mapToArticle(Map<String, dynamic> map) {
    return ArticleRemoteMapper(
      source: SourceRemoteMapper.fromJSON(jsonDecode(map['source'] as String)),
      author: map['author'] as String?,
      title: map['title'] as String,
      description: map['description'] as String?,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: DateTime.parse(map['publishedAt'] as String).toLocal(),
      content: map['content'] as String?,
    );
  }

  @override
  Future<void> cacheNews(NewsRemoteMapper news) async {
    try {
      final db = await database;
      await db.delete('articles');
      for (final article in news.articles) {
        await db.insert(
          'articles',
          _articleToMap(article as ArticleRemoteMapper),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (e) {
      throw CachedException();
    }
  }

  @override
  Future<ArticleRemoteMapper> getArticleByUrl(String url) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'articles',
        where: 'url = ?',
        whereArgs: [url],
      );
      if (maps.isEmpty) {
        throw NotFoundException();
      }
      return _mapToArticle(maps.first);
    } catch (e) {
      if (e is NotFoundException) rethrow;
      throw CachedException();
    }
  }

  @override
  Future<List<ArticleRemoteMapper>> getCachedArticles() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('articles');
      return maps.map((map) => _mapToArticle(map)).toList();
    } catch (e) {
      throw CachedException();
    }
  }
}
