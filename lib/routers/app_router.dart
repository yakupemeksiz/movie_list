import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/views/detail/detail_view.dart';
import 'package:movie_list/views/home/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: DetailRoute.page,
        ),
      ];
}
