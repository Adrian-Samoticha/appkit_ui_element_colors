import 'dart:async';
import 'dart:ui';

import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container.dart';

/// TODO: document this
class UiElementColorContainerSharedInstanceProvider {
  static UiElementColorContainer? _sharedInstance;

  static final _onSharedInstanceUpdatedStreamController =
      StreamController<UiElementColorContainer>.broadcast();

  static UiElementColorContainer? get sharedInstance => _sharedInstance;

  static Stream<UiElementColorContainer> get onSharedInstanceUpdatedStream =>
      _onSharedInstanceUpdatedStreamController.stream;

  static NSAppearanceName _getNSAppearanceNameFromBuildContext(
      BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    switch (brightness) {
      case Brightness.dark:
        return NSAppearanceName.darkAqua;
      case Brightness.light:
        return NSAppearanceName.aqua;
    }
  }

  static Future<void> maybeUpdate(BuildContext context) async {
    final appearanceName = _getNSAppearanceNameFromBuildContext(context);
    final newUiElementColorContainer =
        await UiElementColorContainer.generate(appearanceName);
    if (newUiElementColorContainer != _sharedInstance) {
      _sharedInstance = newUiElementColorContainer;
      _onSharedInstanceUpdatedStreamController.add(newUiElementColorContainer);
    }
  }
}
