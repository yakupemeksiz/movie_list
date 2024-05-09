import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';

void main() {
  group('Movie request model test', () {
    test('should return movie request model', () {
      // given
      const movieModel = MovieRequestModel(page: 1);

      // when
      const result = movieModel;

      // then
      expect(result, isA<MovieRequestModel>());
    });

    test('should return movie request model with toJson', () {
      // given
      const movieModel = MovieRequestModel(page: 1);

      // when
      final result = movieModel.toJson();

      // then
      expect(result, isA<Map<String, dynamic>>());
    });
  });

  // MovieSortBy enum test
  group('MovieSortBy enum test', () {
    test('should return popularity asc', () {
      // given
      const movieSortBy = MovieSortBy.popularityAsc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'popularity.asc');
    });

    test('should return popularity desc', () {
      // given
      const movieSortBy = MovieSortBy.popularityDesc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'popularity.desc');
    });

    test('should return revenue asc', () {
      // given
      const movieSortBy = MovieSortBy.revenueAsc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'revenue.asc');
    });

    test('should return revenue desc', () {
      // given
      const movieSortBy = MovieSortBy.revenueDesc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'revenue.desc');
    });

    test('should return primary release date asc', () {
      // given
      const movieSortBy = MovieSortBy.primaryReleaseDateAsc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'primary_release_date.asc');
    });

    test('should return primary release date desc', () {
      // given
      const movieSortBy = MovieSortBy.primaryReleaseDateDesc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'primary_release_date.desc');
    });

    test('should return vote average asc', () {
      // given
      const movieSortBy = MovieSortBy.voteAverageAsc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'vote_average.asc');
    });

    test('should return vote average desc', () {
      // given
      const movieSortBy = MovieSortBy.voteAverageDesc;

      // when
      final result = movieSortBy.toJson();

      // then
      expect(result, 'vote_average.desc');
    });
  });
}
