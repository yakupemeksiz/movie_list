// ignore_for_file: inference_failure_on_untyped_parameter

final class GenreResponseModel {
  final List<GenreListItemModel> genres;

  const GenreResponseModel({
    required this.genres,
  });

  factory GenreResponseModel.fromJson(Map<String, dynamic> json) =>
      GenreResponseModel(
        genres: List<GenreListItemModel>.from(
          json['genres'].map((x) => GenreListItemModel.fromJson(x)),
        ),
      );
}

final class GenreListItemModel {
  final int id;
  final String name;

  const GenreListItemModel({
    required this.id,
    required this.name,
  });

  factory GenreListItemModel.fromJson(Map<String, dynamic> json) =>
      GenreListItemModel(
        id: json['id'],
        name: json['name'],
      );
}
