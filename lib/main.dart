import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_list/bootstrap.dart';
import 'package:movie_list/common/constants/color_constants.dart';
import 'package:movie_list/routers/app_router.dart';

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
