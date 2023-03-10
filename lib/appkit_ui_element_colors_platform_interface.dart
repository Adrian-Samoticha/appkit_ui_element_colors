import 'dart:ui';

import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'appkit_ui_element_colors.dart';
import 'appkit_ui_element_colors_method_channel.dart';

abstract class AppkitUiElementColorsPlatform extends PlatformInterface {
  /// Constructs a AppkitUiElementColorsPlatform.
  AppkitUiElementColorsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppkitUiElementColorsPlatform _instance =
      MethodChannelAppkitUiElementColors();

  /// The default instance of [AppkitUiElementColorsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppkitUiElementColors].
  static AppkitUiElementColorsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppkitUiElementColorsPlatform] when
  /// they register themselves.
  static set instance(AppkitUiElementColorsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, double>> getColorComponents(
      UiElementColor uiElementColor,
      Set<NSColorComponent> components,
      NSColorSpace colorSpace,
      NSAppearanceName appearance) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Color> getColor(
      UiElementColor uiElementColor, NSAppearanceName appearance) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
