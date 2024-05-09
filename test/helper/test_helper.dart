import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_list/repository/movie_repository.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';
import 'package:movie_list/services/movie_service/movie_service.dart';

import 'json_reader.dart';

@GenerateMocks([MovieService, MovieRepository, FirebaseRemoteConfig])
void main() {}

const genreDummyPath = 'helper/dummy/genre_dummy.json';
const movieDummyPath = 'helper/dummy/movie_list_dummy.json';
const movieDetailPath = 'helper/dummy/movie_detail_dummy.json';
const movieVideosPath = 'helper/dummy/movie_videos_dummy.json';

String get movieString => readJson(movieDummyPath);

String get genreString => readJson(genreDummyPath);

String get movieDetailString => readJson(movieDetailPath);

String get movieVideosString => readJson(movieVideosPath);

final genreModel = GenreResponseModel.fromJson(jsonDecode(genreString));
final movieModel = MovieResponseModel.fromJson(jsonDecode(movieString));
final movieDetailModel =
    MovieDetailResponseModel.fromJson(jsonDecode(movieDetailString));
final movieVideosModel =
    MovieVideoResponseModel.fromJson(jsonDecode(movieVideosString));
