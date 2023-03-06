import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'appkit_ui_element_colors_method_channel.dart';

abstract class AppkitUiElementColorsPlatform extends PlatformInterface {
  /// Constructs a AppkitUiElementColorsPlatform.
  AppkitUiElementColorsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppkitUiElementColorsPlatform _instance = MethodChannelAppkitUiElementColors();

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
}
