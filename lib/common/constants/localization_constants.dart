import 'package:movie_list/services/remote_config_service.dart';

mixin LocalizationConstants {
  static final _config = FirebaseRemoteConfigService();
  static String get home => _config.getString('home');
  static String get minutes => _config.getString('minutes');
}
