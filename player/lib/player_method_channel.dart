import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'player_platform_interface.dart';

/// An implementation of [PlayerPlatform] that uses method channels.
class MethodChannelPlayer extends PlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('player');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
