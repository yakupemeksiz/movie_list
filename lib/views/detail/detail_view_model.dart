import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/common/base/base_view_model.dart';
import 'package:movie_list/repository/movie_repository.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/services/models/response/movie_video_response_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@injectable
final class DetailViewModel extends BaseViewModel {
  final int _id;

  final MovieRepository _movieRepository;

  DetailViewModel(
    @factoryParam this._id,
    this._movieRepository,
  );
  @override
  String get tag => 'DetailViewModel';

  late final MovieVideoResponseModel _videoModel;
  late final MovieDetailResponseModel detailModel;
  late final YoutubePlayerController controller;
  late final String videoKey;
  final CancelToken _cancelToken = CancelToken();

  @override
  void onBindings() {
    flow(() async {
      _videoModel = await eitherHandler(
        () => _movieRepository.getMovieVideos(_cancelToken, _id),
      );
      detailModel = await eitherHandler(
        () => _movieRepository.getMovieDetail(_cancelToken, _id),
      );
      videoKey = _getVideoKey();

      controller = YoutubePlayerController(
        initialVideoId: videoKey,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    });

    super.onBindings();
  }

  String _getVideoKey() {
    return _videoModel.results
            ?.firstWhere(
              orElse: () => const MovieVideoItemModel(),
              (element) =>
                  element.type == 'Trailer' && element.site == 'YouTube',
            )
            .key ??
        '';
  }

  @override
  void dispose() {
    controller.dispose();
    _cancelToken.cancel();
    super.dispose();
  }
}
