import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
import 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
import 'package:appkit_ui_element_colors/macos/ui_element_color.dart';
import 'package:appkit_ui_element_colors/observers/system_color_observer.dart';
import 'package:flutter/services.dart';

export 'package:appkit_ui_element_colors/macos/ns_color_component.dart';
export 'package:appkit_ui_element_colors/macos/ns_color_space.dart';
export 'package:appkit_ui_element_colors/macos/ui_element_color.dart';
export 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_container_instance_provider/shared_ui_element_color_container_instance_provider.dart';
export 'package:appkit_ui_element_colors/convenience/ui_element_color_builder.dart';

class AppkitUiElementColors {
  AppkitUiElementColors._();

  /// The method channel used to interact with the native platform.
  static const methodChannel = MethodChannel('appkit_ui_element_colors');

  static final _systemColorObserver = SystemColorObserver();

  /// The default instance of [SystemColorObserver].
  static SystemColorObserver get systemColorObserver => _systemColorObserver;

  static Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');

    return version;
  }

  /// Generates a map that is populated with the [uiElementColor]’s color
  /// components that have been specified in the [components] set.
  ///
  /// **Example:**
  ///
  /// ```dart
  /// final components = await AppkitUiElementColors.getColorComponents(
  ///   uiElementColor: UiElementColor.selectedControlColor,
  ///   components: {
  ///     NSColorComponent.redComponent,
  ///     NSColorComponent.greenComponent,
  ///     NSColorComponent.blueComponent,
  ///   },
  ///   colorSpace: NSColorSpace.sRGB,
  ///   appearance: NSAppearanceName.aqua,
  /// );
  ///
  /// // prints "{blueComponent: 0.7450980544090271, redComponent: 1.0, greenComponent: 0.9333333373069763}"
  /// print(components);
  /// ```
  static Future<Map<String, double>> getColorComponents({
    required UiElementColor uiElementColor,
    required Set<NSColorComponent> components,
    required NSColorSpace colorSpace,
    required NSAppearanceName appearance,
  }) async {
    final dynamicMap = await methodChannel.invokeMethod('getColorComponents', {
      'uiElementColor': uiElementColor.name,
      'components': components.map((e) => e.name).toList(),
      'colorSpace': colorSpace.name,
      'appearance': appearance.name,
    });

    return Map<String, double>.from(dynamicMap);
  }

  /// Returns a [Color] object that represents the requested [uiElementColor]
  /// with the given [appearance].
  ///
  /// The color is provided in `deviceRGB` color space.
  static Future<Color> getColor({
    required UiElementColor uiElementColor,
    required NSAppearanceName appearance,
  }) async {
    final int hash = await methodChannel.invokeMethod('getColor', {
      'uiElementColor': uiElementColor.name,
      'appearance': appearance.name,
    });

    return Color(hash);
  }
}
