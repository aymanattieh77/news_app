class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    data['category'] = category;
    data['language'] = language;
    data['country'] = country;
    return data;
  }

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] != null ? json['id'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      url: json['url'] != null ? json['url'] as String : null,
      category: json['category'] != null ? json['category'] as String : null,
      language: json['language'] != null ? json['language'] as String : null,
      country: json['country'] != null ? json['country'] as String : null,
    );
  }
}
