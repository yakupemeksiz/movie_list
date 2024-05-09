import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:movie_list/common/constants/app_constants.dart';
import 'package:movie_list/common/constants/environment_constants.dart';

mixin DioClient {
  static final Dio dio = _init();

  static final BaseOptions _baseOptions = BaseOptions(
    queryParameters: {
      'language': Platform.localeName.split('_').join('-'),
    },
    baseUrl: AppConstants.baseUrl,
    headers: {
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': EnvironmentConstants.authorization,
    },
  );

  static Dio _init() {
    final dio = Dio(_baseOptions);
    dio.interceptors.add(
      FancyDioInterceptor(
        options: const FancyDioInspectorOptions(
          consoleOptions: FancyDioInspectorConsoleOptions(
            verbose: true,
          ),
        ),
      ),
    );

    return dio;
  }
}
