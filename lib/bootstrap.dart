import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_list/firebase_options.dart';
import 'package:movie_list/inject.dart';
import 'package:movie_list/services/remote_config_service.dart';

/// Bootstrap the app with the given builder function
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  /// Run the app in a zone to catch all errors and log them to the console
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAnalytics.instance.setUserProperty(
      name: 'language',
      value: Platform.localeName.split('_').first,
    );
    await FirebaseAnalytics.instance.logAppOpen();

    await FirebaseRemoteConfigService().initialize();

    /// Load environment variables from .env file
    await dotenv.load();

    /// Configure dependencies using injectable
    configureDependencies();

    /// Run the app with EasyLocalization
    runApp(await builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack, name: 'bootstrap');
  });

  /// Log all errors to the console
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };
}
