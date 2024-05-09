import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';
import 'package:movie_list/services/movie_service/movie_service.dart';

import '../helper/test_helper.dart';

void main() {
  late MovieService movieService;
  late MockWebServer mockWebServer;
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  };

  setUp(() async {
    mockWebServer = MockWebServer();
    await mockWebServer.start();

    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    movieService = MovieService(dio, baseUrl: mockWebServer.url);
  });

  tearDown(() {
    mockWebServer.shutdown();
  });

  group('Testing getMovies', () {
    test('should return movie list', () async {
      mockWebServer.enqueue(
        body: movieString,
        headers: headers,
        delay: Duration.zero,
      );

      final response = await movieService.getMovies(
        CancelToken(),
        requestModel: const MovieRequestModel(page: 1),
      );

      expect(response.results, isNotEmpty);
    });

    test('should return movie list with error', () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
        delay: Duration.zero,
      );

      expect(
        movieService.getMovies(
          CancelToken(),
          requestModel: const MovieRequestModel(page: 1),
        ),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('Testing getGenres', () {
    test('should return genre list', () async {
      mockWebServer.enqueue(
        body: genreString,
        headers: headers,
        delay: Duration.zero,
      );

      final response = await movieService.getGenres(CancelToken());

      expect(response.genres, isNotEmpty);
    });

    test('should return genre list with error', () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
        delay: Duration.zero,
      );

      expect(
        movieService.getGenres(CancelToken()),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('Testing getMovieDetail', () {
    test('should return movie detail', () async {
      mockWebServer.enqueue(
        body: movieDetailString,
        headers: headers,
        delay: Duration.zero,
      );

      final response = await movieService.getMovieDetail(
        CancelToken(),
        940721,
      );

      expect(response.id, 940721);
    });

    test('should return movie detail with error', () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
        delay: Duration.zero,
      );

      expect(
        movieService.getMovieDetail(CancelToken(), 1),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('Testing getMovieVideos', () {
    test('should return movie videos', () async {
      mockWebServer.enqueue(
        body: movieDetailString,
        headers: headers,
        delay: Duration.zero,
      );

      final response = await movieService.getMovieVideos(
        CancelToken(),
        940721,
      );

      expect(response.id, 940721);
    });

    test('should return movie videos with error', () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
        delay: Duration.zero,
      );

      expect(
        movieService.getMovieVideos(CancelToken(), 1),
        throwsA(isA<DioException>()),
      );
    });
  });
}
