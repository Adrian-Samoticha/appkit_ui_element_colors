import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'appkit_ui_element_colors.dart';
import 'appkit_ui_element_colors_platform_interface.dart';

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
  Future<Map<String, double>> getColor(UiElementColor uiElementColor,
      Set<NSColorComponent> components, NSColorSpace colorSpace) async {
    final dynamicMap = await methodChannel.invokeMethod('getColor', {
      'uiElementColor': uiElementColor.name,
      'components': components.map((e) => e.name).toList(),
      'colorSpace': colorSpace.name,
    });

    return Map<String, double>.from(dynamicMap);
  }
}
