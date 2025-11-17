import 'package:news_indo_app/features/news/domain/entities/source/source.dart';

class SourceRemoteMapper extends Source {
  const SourceRemoteMapper({required super.id, required super.name});

  factory SourceRemoteMapper.fromJSON(Map<String, dynamic> json) {
    final id = json['id'];
    return SourceRemoteMapper(
      id: id != null ? json['id'] : null,
      name: json["name"],
    );
  }

  Map<String, dynamic> toJSON() => {'id': id, 'name': name};

  Source get toEntity => Source(id: id, name: name);
}
