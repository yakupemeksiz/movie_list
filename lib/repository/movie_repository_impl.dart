import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/common/failure/failure.dart';
import 'package:movie_list/common/mixins/network_handler_mixin.dart';
import 'package:movie_list/repository/movie_repository.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';
import 'package:movie_list/services/movie_service/movie_service.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl with NetworkHandlerMixin implements MovieRepository {
  final MovieService _movieService;
  const MovieRepositoryImpl(this._movieService);

  @override
  Future<Either<Failure?, GenreResponseModel>> getGenres(
    CancelToken cancelToken,
  ) async {
    return networkHandler(() => _movieService.getGenres(cancelToken));
  }

  @override
  Future<Either<Failure?, MovieDetailResponseModel>> getMovieDetail(
    CancelToken cancelToken,
    int id,
  ) async {
    return networkHandler(() => _movieService.getMovieDetail(cancelToken, id));
  }

  @override
  Future<Either<Failure?, MovieVideoResponseModel>> getMovieVideos(
    CancelToken cancelToken,
    int id,
  ) {
    return networkHandler(() => _movieService.getMovieVideos(cancelToken, id));
  }

  @override
  Future<Either<Failure?, MovieResponseModel>> getMovies(
    CancelToken cancelToken,
    MovieRequestModel requestModel,
  ) {
    return networkHandler(
      () => _movieService.getMovies(cancelToken, requestModel: requestModel),
    );
  }
}
