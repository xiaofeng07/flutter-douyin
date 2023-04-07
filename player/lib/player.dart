
import 'package:fijkplayer/fijkplayer.dart';

import 'player_platform_interface.dart';

class Player extends FijkPlayer{
  Future<String?> getPlatformVersion() {
    return PlayerPlatform.instance.getPlatformVersion();
  }
}
