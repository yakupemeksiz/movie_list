import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';

import '../../helper/test_helper.dart';

void main() {
  group('Test genre model', () {
    test('should return genre model', () {
      // given
      final genreModel = GenreResponseModel.fromJson(jsonDecode(genreString));

      // when
      final result = genreModel;

      // then
      expect(result, isA<GenreResponseModel>());
    });

    test('should return genre list', () {
      // given
      final genreModel = GenreResponseModel.fromJson(jsonDecode(genreString));

      // when
      final result = genreModel.genres;

      // then
      expect(result, isA<List<GenreListItemModel>>());
    });
  });
}
