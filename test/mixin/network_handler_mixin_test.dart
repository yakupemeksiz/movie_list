import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/common/failure/failure.dart';
import 'package:movie_list/common/mixins/network_handler_mixin.dart';

void main() {
  group('NetworkHandlerMixin', () {
    late NetworkHandlerMixin networkHandlerMixin;

    setUp(() {
      networkHandlerMixin = _MockMixin();
    });

    test('Successful connection should return Right', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        return 'Success';
      });

      expect(result, isA<Right<Failure?, String>>());
      expect(result.right, equals('Success'));
    });

    test('Connection failure should return Left(ConnectionFailure)', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw const SocketException('Failed to connect');
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<ConnectionFailure>());
    });

    test('Timeout failure should return Left(TimeoutFailure)', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.connectionTimeout);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<TimeoutFailure>());
    });
    test('Timeout failure should return Left(TimeoutFailure)', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.sendTimeout);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<TimeoutFailure>());
    });

    test('Other errors should return Left(UnknownFailure)', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw Exception('Some unknown error');
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<UnknownFailure>());
    });

    test('Bad certificate failure should return Left(ConnectionFailure)',
        () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.badCertificate);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<ConnectionFailure>());
    });

    test('Bad response failure should return Left(ConnectionFailure)',
        () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.badResponse);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<ConnectionFailure>());
    });

    test('Connection error failure should return Left(ConnectionFailure)',
        () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.connectionError);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<ConnectionFailure>());
    });

    test('Cancel failure should return null', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.cancel);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, null);
    });

    test('Unknown failure should return Left(UnknownFailure)', () async {
      final result = await networkHandlerMixin.networkHandler(() async {
        throw _MockDioError(DioExceptionType.unknown);
      });

      expect(result, isA<Left<Failure?, String>>());
      expect(result.left, isA<UnknownFailure>());
    });
  });
}

class _MockMixin with NetworkHandlerMixin {}

class _MockDioError extends DioException {
  _MockDioError(DioExceptionType type)
      : super(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 404,
          ),
          type: type,
        );
}
