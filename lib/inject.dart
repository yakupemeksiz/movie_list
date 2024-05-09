import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/common/base/dio_client.dart';
import 'package:movie_list/inject.config.dart';
import 'package:movie_list/services/movie_service/movie_service.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class RegisterModule {
  final MovieService movieService = MovieService(DioClient.dio);
}
