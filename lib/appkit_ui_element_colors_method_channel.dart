import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'appkit_ui_element_colors.dart';

/// An implementation of [AppkitUiElementColorsPlatform] that uses method
/// channels.
class MethodChannelAppkitUiElementColors extends AppkitUiElementColorsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('appkit_ui_element_colors');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');

    return version;
  }

  @override
  Future<Map<String, double>> getColorComponents(
      UiElementColor uiElementColor,
      Set<NSColorComponent> components,
      NSColorSpace colorSpace,
      NSAppearanceName appearance) async {
    final dynamicMap = await methodChannel.invokeMethod('getColorComponents', {
      'uiElementColor': uiElementColor.name,
      'components': components.map((e) => e.name).toList(),
      'colorSpace': colorSpace.name,
      'appearance': appearance.name,
    });

    return Map<String, double>.from(dynamicMap);
  }

  @override
  Future<Color> getColor(
      UiElementColor uiElementColor, NSAppearanceName appearance) async {
    final int hash = await methodChannel.invokeMethod('getColor', {
      'uiElementColor': uiElementColor.name,
      'appearance': appearance.name,
    });

    return Color(hash);
  }
}
