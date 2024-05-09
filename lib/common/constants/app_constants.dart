import 'package:movie_list/services/remote_config_service.dart';

mixin AppConstants {
  static final _config = FirebaseRemoteConfigService();
  static String get baseUrl => _config.getString('baseUrl');
  static String get imagePath => _config.getString('imagePath');
}
