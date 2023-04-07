#include "include/player/player_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "player_plugin.h"

void PlayerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  player::PlayerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
