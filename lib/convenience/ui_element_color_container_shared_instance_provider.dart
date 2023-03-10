import 'dart:async';
import 'dart:ui';

import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container.dart';

/// A class that provides a global instance of [UiElementColorContainer].
///
/// [sharedInstance] is initially `null` until [maybeUpdate] is called for the
/// first time.
class UiElementColorContainerSharedInstanceProvider {
  /// The global shared instance of [UiElementColorContainer].
  static UiElementColorContainer? _sharedInstance;

  /// A stream controller for the “on shared instance updated” stream.
  static final _onSharedInstanceUpdatedStreamController =
      StreamController<UiElementColorContainer>.broadcast();

  /// The global shared instance of [UiElementColorContainer].
  static UiElementColorContainer? get sharedInstance => _sharedInstance;

  /// A stream that can be used to listen for [sharedInstance] changes.
  static Stream<UiElementColorContainer> get onSharedInstanceUpdatedStream =>
      _onSharedInstanceUpdatedStreamController.stream;

  /// Gets a fitting [NSAppearanceName] given the given [BuildContext]’s
  /// platform brightness.
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

  /// Generates a new [UiElementColorContainer] and updates the current
  /// [sharedInstance] if a change is detected.
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
