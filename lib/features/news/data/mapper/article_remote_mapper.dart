import 'package:news_indo_app/common/utils/url_images.dart';
import 'package:news_indo_app/features/news/data/mapper/source_remote_mapper.dart';
import 'package:news_indo_app/features/news/domain/entities/article/article.dart';

class ArticleRemoteMapper extends Article {
  const ArticleRemoteMapper({
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleRemoteMapper.fromJSON(Map<String, dynamic> json) {
    final author = json["author"];
    final desc = json['description'];
    final image = json['urlToImage'];
    final content = json['content'];
    return ArticleRemoteMapper(
      source: SourceRemoteMapper.fromJSON(json['source']),
      author: author != null ? json["author"] : null,
      title: json['title'],
      description: desc != null ? json['description'] : null,
      url: json['url'],
      urlToImage: image != null ? URLImages.image(image) : null,
      publishedAt: DateTime.parse(json['publishedAt']).toLocal(),
      content: content != null ? json['content'] : null,
    );
  }

  Map<String, dynamic> toJSON() => {
    'source': (source is SourceRemoteMapper)
        ? (source as SourceRemoteMapper).toJSON()
        : {'source': source},
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };

  Article get toEntity => Article(
    source: (source as SourceRemoteMapper).toEntity,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );
}
