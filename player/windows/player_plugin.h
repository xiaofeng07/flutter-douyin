#ifndef FLUTTER_PLUGIN_PLAYER_PLUGIN_H_
#define FLUTTER_PLUGIN_PLAYER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace player {

class PlayerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PlayerPlugin();

  virtual ~PlayerPlugin();

  // Disallow copy and assign.
  PlayerPlugin(const PlayerPlugin&) = delete;
  PlayerPlugin& operator=(const PlayerPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace player

#endif  // FLUTTER_PLUGIN_PLAYER_PLUGIN_H_
