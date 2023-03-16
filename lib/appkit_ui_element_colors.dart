import 'dart:ui';

import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
import 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
import 'package:appkit_ui_element_colors/macos/ui_element_color.dart';

import 'appkit_ui_element_colors_platform_interface.dart';

export 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
export 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
export 'package:appkit_ui_element_colors/macos/ui_element_color.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_container_shared_instance_provider.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_builder.dart';
export 'package:appkit_ui_element_colors/appkit_ui_element_colors_platform_interface.dart';

class AppkitUiElementColors {
  AppkitUiElementColors._();

  static Future<String?> getPlatformVersion() {
    return AppkitUiElementColorsPlatform.instance.getPlatformVersion();
  }

  static Future<Map<String, double>> getColorComponents(
      UiElementColor uiElementColor,
      Set<NSColorComponent> components,
      NSColorSpace colorSpace,
      NSAppearanceName appearance) {
    return AppkitUiElementColorsPlatform.instance
        .getColorComponents(uiElementColor, components, colorSpace, appearance);
  }

  static Future<Color> getColor(
      UiElementColor uiElementColor, NSAppearanceName appearance) {
    return AppkitUiElementColorsPlatform.instance
        .getColor(uiElementColor, appearance);
  }
}
