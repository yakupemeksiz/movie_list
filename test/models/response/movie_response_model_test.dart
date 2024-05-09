//movie response model test
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';

import '../../helper/test_helper.dart';

void main() {
  group('Movie response model test', () {
    test('should return movie response model', () {
      // given
      final movieModel = MovieResponseModel.fromJson(jsonDecode(movieString));

      // when
      final result = movieModel;

      // then
      expect(result, isA<MovieResponseModel>());
    });

    test('should return movie list', () {
      // given
      final movieModel = MovieResponseModel.fromJson(jsonDecode(movieString));

      // when
      final result = movieModel.results;

      // then
      expect(result, isA<List<MovieListItemModel>>());
    });

    test('should return movie list item with copyWith', () {
      // given
      final movieModel = MovieResponseModel.fromJson(jsonDecode(movieString));

      // when
      final result = movieModel.results.first.copyWith(
        id: 1,
        overview: 'overview',
        posterPath: 'posterPath',
        releaseDate: DateTime.now(),
        title: 'title',
        voteAverage: 1,
        voteCount: 1,
        genreIds: [1],
        genres: 'genres',
      );

      // then
      expect(result, isA<MovieListItemModel>());
    });
    test('should return movie list item with copyWith default value', () {
      // given
      final movieModel = MovieResponseModel.fromJson(jsonDecode(movieString));

      // when
      final result = movieModel.results.first.copyWith();

      // then
      expect(result, isA<MovieListItemModel>());
    });
  });
}
