//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <player/player_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) player_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PlayerPlugin");
  player_plugin_register_with_registrar(player_registrar);
}
