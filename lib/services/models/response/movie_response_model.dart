final class MovieResponseModel {
  final int page;
  final List<MovieListItemModel> results;
  final int totalPages;
  final int totalResults;

  const MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json['page'],
        results: List<MovieListItemModel>.from(
          json['results']!.map((x) => MovieListItemModel.fromJson(x)),
        ),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
}

final class MovieListItemModel {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? releaseDate;
  final List<int>? genreIds;
  final String? genres;

  const MovieListItemModel({
    required this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.genres,
  });

  factory MovieListItemModel.fromJson(Map<String, dynamic> json) =>
      MovieListItemModel(
        id: json['id'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        title: json['title'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
        genreIds: json['genre_ids'] == null
            ? []
            : List<int>.from(json['genre_ids'].map((x) => x)),
      );

  MovieListItemModel copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    DateTime? releaseDate,
    List<int>? genreIds,
    String? genres,
  }) {
    return MovieListItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      releaseDate: releaseDate ?? this.releaseDate,
      genreIds: genreIds ?? this.genreIds,
      genres: genres ?? this.genres,
    );
  }
}
