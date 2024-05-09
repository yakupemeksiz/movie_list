final class MovieVideoResponseModel {
  final int? id;
  final List<MovieVideoItemModel>? results;

  const MovieVideoResponseModel({
    this.id,
    this.results,
  });

  factory MovieVideoResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieVideoResponseModel(
        id: json['id'],
        results: json['results'] == null
            ? []
            : List<MovieVideoItemModel>.from(
                json['results']!.map(
                  (x) => MovieVideoItemModel.fromJson(x),
                ),
              ),
      );
}

final class MovieVideoItemModel {
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  const MovieVideoItemModel({
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieVideoItemModel.fromJson(Map<String, dynamic> json) =>
      MovieVideoItemModel(
        name: json['name'],
        key: json['key'],
        site: json['site'],
        size: json['size'],
        type: json['type'],
        official: json['official'],
        publishedAt: json['published_at'] == null
            ? null
            : DateTime.parse(json['published_at']),
        id: json['id'],
      );
}
