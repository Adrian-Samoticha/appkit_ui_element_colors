import 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
import 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
import 'package:appkit_ui_element_colors/macos/ui_element_color.dart';

import 'appkit_ui_element_colors_platform_interface.dart';

export 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
export 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
export 'package:appkit_ui_element_colors/macos/ui_element_color.dart';

class AppkitUiElementColors {
  Future<String?> getPlatformVersion() {
    return AppkitUiElementColorsPlatform.instance.getPlatformVersion();
  }

  Future<Map<String, double>> getColorComponents(UiElementColor uiElementColor,
      Set<NSColorComponent> components, NSColorSpace colorSpace) {
    return AppkitUiElementColorsPlatform.instance
        .getColorComponents(uiElementColor, components, colorSpace);
  }
}
