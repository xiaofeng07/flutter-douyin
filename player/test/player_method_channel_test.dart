import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:player/player_method_channel.dart';

void main() {
  MethodChannelPlayer platform = MethodChannelPlayer();
  const MethodChannel channel = MethodChannel('player');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
