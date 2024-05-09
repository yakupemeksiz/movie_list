import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/common/failure/failure.dart';

void main() {
  group('Failure classes', () {
    test('ServerFailure should contain correct message', () {
      const failure = ServerFailure('Server error');
      expect(failure.message, equals('Server error'));
    });

    test('ConnectionFailure should contain correct message', () {
      const failure = ConnectionFailure('Connection error');
      expect(failure.message, equals('Connection error'));
    });

    test('DatabaseFailure should contain correct message', () {
      const failure = DatabaseFailure('Database error');
      expect(failure.message, equals('Database error'));
    });

    test('TimeoutFailure should contain correct message', () {
      const failure = TimeoutFailure('Timeout error');
      expect(failure.message, equals('Timeout error'));
    });

    test('UnknownFailure should contain correct message', () {
      const failure = UnknownFailure('Unknown error');
      expect(failure.message, equals('Unknown error'));
    });
  });
}
