import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';

import '../../helper/test_helper.dart';

void main() {
  group('Movie detail model test', () {
    test('should return movie detail model', () {
      // given
      final movieDetailModel =
          MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

      // when
      final result = movieDetailModel;

      // then
      expect(result, isA<MovieDetailResponseModel>());
    });

    test('should return genre list', () {
      // given
      final movieDetailModel =
          MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

      // when
      final result = movieDetailModel.genres;

      // then
      expect(result, isA<List<GenreListItemModel>>());
    });

    test('should return belongs to collection model or null', () {
      // given
      final movieDetailModel =
          MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

      // when
      final result = movieDetailModel.belongsToCollection;

      // then
      expect(result, isA<BelongsToCollectionModel?>());
    });
  });

  test('should return production company model', () {
    // given
    final movieDetailModel =
        MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

    // when
    final result = movieDetailModel.productionCompanies;

    // then
    expect(result, isA<List<ProductionCompanyModel>>());
  });

  test('should return production country model', () {
    // given
    final movieDetailModel =
        MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

    // when
    final result = movieDetailModel.productionCountries;

    // then
    expect(result, isA<List<ProductionCountryModel>>());
  });

  test('should return spoken language model', () {
    // given
    final movieDetailModel =
        MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));

    // when
    final result = movieDetailModel.spokenLanguages;

    // then
    expect(result, isA<List<SpokenLanguageModel>>());
  });
}
