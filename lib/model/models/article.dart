import 'package:news/model/models/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      author: json['author'] != null ? json['author'] as String : null,
      title: json['title'] != null ? json['title'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      url: json['url'] != null ? json['url'] as String : null,
      urlToImage:
          json['urlToImage'] != null ? json['urlToImage'] as String : null,
      publishedAt:
          json['publishedAt'] != null ? json['publishedAt'] as String : null,
      content: json['content'] != null ? json['content'] as String : null,
    );
  }
}
