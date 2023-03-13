import 'dart:async';
import 'dart:ui';

import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container.dart';

/// A class that provides a local owned instance of [UiElementColorContainer].
///
/// [instance] is initially `null` until [maybeUpdate] is called for the
/// first time.
class UiElementColorContainerOwnedInstanceProvider {
  /// The local instance of [UiElementColorContainer].
  UiElementColorContainer? _instance;

  /// A stream controller for the “on instance updated” stream.
  final _onInstanceUpdatedStreamController =
      StreamController<UiElementColorContainer>.broadcast();

  /// The local instance of [UiElementColorContainer].
  UiElementColorContainer? get instance => _instance;

  /// A stream that can be used to listen for [instance] changes.
  Stream<UiElementColorContainer> get onInstanceUpdatedStream =>
      _onInstanceUpdatedStreamController.stream;

  /// Gets a fitting [NSAppearanceName] given the given [BuildContext]’s
  /// platform brightness.
  NSAppearanceName _getNSAppearanceNameFromBuildContext(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    switch (brightness) {
      case Brightness.dark:
        return NSAppearanceName.darkAqua;
      case Brightness.light:
        return NSAppearanceName.aqua;
    }
  }

  /// Generates a new [UiElementColorContainer] and updates the current
  /// [instance] if a change is detected.
  Future<void> maybeUpdate(BuildContext context) async {
    final appearanceName = _getNSAppearanceNameFromBuildContext(context);
    final newUiElementColorContainer =
        await UiElementColorContainer.generate(appearanceName);

    if (newUiElementColorContainer != _instance) {
      _instance = newUiElementColorContainer;
      _onInstanceUpdatedStreamController.add(newUiElementColorContainer);
    }
  }
}
