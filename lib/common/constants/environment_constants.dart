import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment constants for the app to use.
mixin EnvironmentConstants {
  /// The API key for the google books API.
  static String get authorization {
    final key = dotenv.env['Authorization'];

    if (key == null) {
      throw Exception('Authorization is not defined in .env');
    }

    return key;
  }
}
