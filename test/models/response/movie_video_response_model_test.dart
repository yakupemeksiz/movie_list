// movie_video_response_model_test.dart

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';

import '../../helper/test_helper.dart';

void main() {
  group('MovieVideoResponseModel', () {
    test('fromJson', () {
      final movieVideoResponseModel =
          MovieVideoResponseModel.fromJson(jsonDecode(movieVideosString));

      expect(movieVideoResponseModel, isA<MovieVideoResponseModel>());
    });
  });
}
