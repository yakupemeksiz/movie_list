import 'package:movie_list/services/models/response/genre_response_model.dart';

class MovieDetailResponseModel {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollectionModel? belongsToCollection;
  final int? budget;
  final List<GenreListItemModel>? genres;
  final String? homepage;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyModel>? productionCompanies;
  final List<ProductionCountryModel>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageModel>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetailResponseModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailResponseModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'] == null
            ? null
            : BelongsToCollectionModel.fromJson(json['belongs_to_collection']),
        budget: json['budget'],
        genres: json['genres'] == null
            ? []
            : List<GenreListItemModel>.from(
                json['genres']!.map(
                  (x) => GenreListItemModel.fromJson(x),
                ),
              ),
        homepage: json['homepage'],
        id: json['id'],
        originCountry: json['origin_country'] == null
            ? []
            : List<String>.from(
                json['origin_country']!.map((x) => x),
              ),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity']?.toDouble(),
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? []
            : List<ProductionCompanyModel>.from(
                json['production_companies']!.map(
                  (x) => ProductionCompanyModel.fromJson(x),
                ),
              ),
        productionCountries: json['production_countries'] == null
            ? []
            : List<ProductionCountryModel>.from(
                json['production_countries']!.map(
                  (x) => ProductionCountryModel.fromJson(x),
                ),
              ),
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: json['spoken_languages'] == null
            ? []
            : List<SpokenLanguageModel>.from(
                json['spoken_languages']!.map(
                  (x) => SpokenLanguageModel.fromJson(x),
                ),
              ),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
      );
}

final class BelongsToCollectionModel {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      BelongsToCollectionModel(
        id: json['id'],
        name: json['name'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );
}

final class ProductionCompanyModel {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompanyModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json['id'],
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country'],
      );
}

final class ProductionCountryModel {
  final String? iso31661;
  final String? name;

  const ProductionCountryModel({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        iso31661: json['iso_3166_1'],
        name: json['name'],
      );
}

final class SpokenLanguageModel {
  final String? englishName;
  final String? iso6391;
  final String? name;

  const SpokenLanguageModel({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageModel(
        englishName: json['english_name'],
        iso6391: json['iso_639_1'],
        name: json['name'],
      );
}
