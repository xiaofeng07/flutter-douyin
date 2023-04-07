import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'player_method_channel.dart';

abstract class PlayerPlatform extends PlatformInterface {
  /// Constructs a PlayerPlatform.
  PlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlayerPlatform _instance = MethodChannelPlayer();

  /// The default instance of [PlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlayer].
  static PlayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlayerPlatform] when
  /// they register themselves.
  static set instance(PlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
