// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_list/inject.dart' as _i8;
import 'package:movie_list/repository/movie_repository.dart' as _i4;
import 'package:movie_list/repository/movie_repository_impl.dart' as _i5;
import 'package:movie_list/services/movie_service/movie_service.dart' as _i3;
import 'package:movie_list/views/detail/detail_view_model.dart' as _i7;
import 'package:movie_list/views/home/home_view_model.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.MovieService>(() => registerModule.movieService);
    gh.factory<_i4.MovieRepository>(
        () => _i5.MovieRepositoryImpl(gh<_i3.MovieService>()));
    gh.factory<_i6.HomeViewModel>(
        () => _i6.HomeViewModel(gh<_i4.MovieRepository>()));
    gh.factoryParam<_i7.DetailViewModel, int, dynamic>((
      _id,
      _,
    ) =>
        _i7.DetailViewModel(
          _id,
          gh<_i4.MovieRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
