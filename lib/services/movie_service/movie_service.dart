import 'package:dio/dio.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';
import 'package:retrofit/retrofit.dart';

part './movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  static const String _basePath = '/3';

  @GET('$_basePath/discover/movie')
  Future<MovieResponseModel> getMovies(
    @CancelRequest() CancelToken cancelToken, {
    @Queries() required MovieRequestModel requestModel,
  });

  @GET('$_basePath/genre/movie/list')
  Future<GenreResponseModel> getGenres(
    @CancelRequest() CancelToken cancelToken,
  );

  @GET('$_basePath/movie/{id}')
  Future<MovieDetailResponseModel> getMovieDetail(
    @CancelRequest() CancelToken cancelToken,
    @Path('id') int id,
  );

  @GET('$_basePath/movie/{id}/videos')
  Future<MovieVideoResponseModel> getMovieVideos(
    @CancelRequest() CancelToken cancelToken,
    @Path('id') int id,
  );
}
