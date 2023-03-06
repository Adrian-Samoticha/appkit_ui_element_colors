import 'appkit_ui_element_colors_platform_interface.dart';

class AppkitUiElementColors {
  Future<String?> getPlatformVersion() {
    return AppkitUiElementColorsPlatform.instance.getPlatformVersion();
  }
}
