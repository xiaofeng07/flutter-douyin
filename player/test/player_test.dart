import 'package:flutter_test/flutter_test.dart';
import 'package:player/player.dart';
import 'package:player/player_platform_interface.dart';
import 'package:player/player_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlayerPlatform
    with MockPlatformInterfaceMixin
    implements PlayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlayerPlatform initialPlatform = PlayerPlatform.instance;

  test('$MethodChannelPlayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlayer>());
  });

  test('getPlatformVersion', () async {
    Player playerPlugin = Player();
    MockPlayerPlatform fakePlatform = MockPlayerPlatform();
    PlayerPlatform.instance = fakePlatform;

    expect(await playerPlugin.getPlatformVersion(), '42');
  });
}
