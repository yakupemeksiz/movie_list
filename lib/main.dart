import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_list/common/constants/color_constants.dart';
import 'package:movie_list/firebase_options.dart';
import 'package:movie_list/inject.dart';
import 'package:movie_list/routers/app_router.dart';
import 'package:movie_list/services/remote_config_service.dart';

part 'bootstrap.dart';

void main() async {
  await bootstrap(
    () => App(),
  );
}

final class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: ColorConstants.primaryColor,
          ),
        );
      },
    );
  }
}
