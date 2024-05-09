import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_list/repository/movie_repository_impl.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';

import '../helper/test_helper.dart';
import '../helper/test_helper.mocks.dart';

void main() {
  late MockMovieService mockMovieService;
  late MovieRepositoryImpl movieRepositoryImpl;

  setUp(() {
    mockMovieService = MockMovieService();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieService);
  });

  group('Testing getGenres', () {
    provideDummy(genreModel);
    test('should return genre list', () async {
      when(mockMovieService.getGenres(any))
          .thenAnswer((_) async => Future.value(genreModel));

      final response = await movieRepositoryImpl.getGenres(CancelToken());

      expect(response.isRight, true);
    });

    test('should return genre list with error', () async {
      when(mockMovieService.getGenres(any)).thenThrow(Exception());

      final response = await movieRepositoryImpl.getGenres(CancelToken());

      expect(response.isLeft, true);
    });
  });

  group('Testing getMovies', () {
    provideDummy(movieModel);
    test('should return movie list', () async {
      when(
        mockMovieService.getMovies(
          any,
          requestModel: anyNamed('requestModel'),
        ),
      ).thenAnswer((_) async => Future.value(movieModel));

      final response = await movieRepositoryImpl.getMovies(
        CancelToken(),
        const MovieRequestModel(page: 1),
      );

      expect(response.isRight, true);
    });

    test('should return movie list with error', () async {
      when(
        mockMovieService.getMovies(
          any,
          requestModel: anyNamed('requestModel'),
        ),
      ).thenThrow(Exception());

      final response = await movieRepositoryImpl.getMovies(
        CancelToken(),
        const MovieRequestModel(page: 1),
      );

      expect(response.isLeft, true);
    });
  });

  group('Testing getMovieDetail', () {
    provideDummy(movieDetailModel);
    test('should return movie detail', () async {
      when(
        mockMovieService.getMovieDetail(
          any,
          any,
        ),
      ).thenAnswer((_) async => Future.value(movieDetailModel));

      final response = await movieRepositoryImpl.getMovieDetail(
        CancelToken(),
        1,
      );

      expect(response.isRight, true);
    });

    test('should return movie detail with error', () async {
      when(
        mockMovieService.getMovieDetail(
          any,
          any,
        ),
      ).thenThrow(Exception());

      final response = await movieRepositoryImpl.getMovieDetail(
        CancelToken(),
        1,
      );

      expect(response.isLeft, true);
    });
  });

  group('Testing getMovieVideos', () {
    provideDummy(movieVideosModel);
    test('should return movie videos', () async {
      when(
        mockMovieService.getMovieVideos(
          any,
          any,
        ),
      ).thenAnswer((_) async => Future.value(movieVideosModel));

      final response = await movieRepositoryImpl.getMovieVideos(
        CancelToken(),
        1,
      );

      expect(response.isRight, true);
    });

    test('should return movie videos with error', () async {
      when(
        mockMovieService.getMovieVideos(
          any,
          any,
        ),
      ).thenThrow(Exception());

      final response = await movieRepositoryImpl.getMovieVideos(
        CancelToken(),
        1,
      );

      expect(response.isLeft, true);
    });
  });
}
