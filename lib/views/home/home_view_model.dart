import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/common/base/base_view_model.dart';
import 'package:movie_list/repository/movie_repository.dart';
import 'package:movie_list/services/models/request/movie_request_model.dart';
import 'package:movie_list/services/models/response/genre_response_model.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';

@injectable
final class HomeViewModel extends BaseViewModel {
  final MovieRepository _movieRepository;
  HomeViewModel(this._movieRepository);

  @override
  String get tag => 'HomeViewModel';

  late final GenreResponseModel genreModel;

  final pagingController =
      PagingController<int, MovieListItemModel>(firstPageKey: 1);
  final CancelToken _cancelToken = CancelToken();

  @override
  void onBindings() {
    flow(() async {
      genreModel =
          await eitherHandler(() => _movieRepository.getGenres(_cancelToken));
      await _fetch();
    });
    pagingController.addPageRequestListener((pageKey) {
      _fetch(pageKey: pageKey);
    });

    super.onBindings();
  }

  Future<void> _fetch({int pageKey = 1}) async {
    final newItems = await eitherHandler(
      () => _movieRepository.getMovies(
        _cancelToken,
        MovieRequestModel(page: pageKey),
      ),
    );

    final isLastPage = newItems.page == newItems.totalPages;

    final movies = newItems.results.map((e) {
      final genre = genreModel.genres
          .where((element) => e.genreIds!.contains(element.id))
          .toList();
      return e.copyWith(genres: genre.map((e) => e.name).join(', '));
    }).toList();

    if (isLastPage) {
      pagingController.appendLastPage(movies);
    } else {
      pagingController.appendPage(movies, pageKey + 1);
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    _cancelToken.cancel();
    super.dispose();
  }
}
