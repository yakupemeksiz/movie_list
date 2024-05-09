import 'package:firebase_remote_config/firebase_remote_config.dart';

final class FirebaseRemoteConfigService {
  factory FirebaseRemoteConfigService() =>
      instance ??= FirebaseRemoteConfigService._();
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? instance;

  final FirebaseRemoteConfig _remoteConfig;

  Future<void> initialize() async {
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: Duration.zero,
        minimumFetchInterval: Duration.zero,
      ),
    );

    await _remoteConfig.fetchAndActivate();
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
