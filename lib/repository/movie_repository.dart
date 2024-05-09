import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:movie_list/common/failure/failure.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';

abstract interface class MovieRepository {
  Future<Either<Failure?, MovieResponseModel>> getMovies(
    CancelToken cancelToken,
    MovieRequestModel requestModel,
  );
  Future<Either<Failure?, GenreResponseModel>> getGenres(
    CancelToken cancelToken,
  );
  Future<Either<Failure?, MovieDetailResponseModel>> getMovieDetail(
    CancelToken cancelToken,
    int id,
  );
  Future<Either<Failure?, MovieVideoResponseModel>> getMovieVideos(
    CancelToken cancelToken,
    int id,
  );
}
