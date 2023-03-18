import 'dart:async';
import 'dart:ui';

import 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container_instance_provider.dart';

/// A class that provides a local owned instance of [UiElementColorContainer].
///
/// [instance] is initially `null` until [maybeUpdate] is called for the
/// first time.
class OwnedUiElementColorContainerInstanceProvider
    implements UiElementColorContainerInstanceProvider {
  /// Creates an [OwnedUiElementColorContainerInstanceProvider], a class that
  /// provides a local owned instance of [UiElementColorContainer].
  OwnedUiElementColorContainerInstanceProvider({this.nsAppearanceNameOverride});

  /// Overrides the [NSAppearanceName] to be used for the generation of
  /// [UiElementColorContainer]s.
  ///
  /// May be null, in which case the [NSAppearanceName] to be used is determined
  /// from the current [MediaQueryData].
  final NSAppearanceName? nsAppearanceNameOverride;

  /// The local instance of [UiElementColorContainer].
  UiElementColorContainer? _instance;

  /// A stream controller for the “on instance updated” stream.
  final _onInstanceUpdatedStreamController =
      StreamController<UiElementColorContainer>.broadcast();

  /// The local instance of [UiElementColorContainer].
  @override
  UiElementColorContainer? get instance => _instance;

  /// A stream that can be used to listen for [instance] changes.
  @override
  Stream<UiElementColorContainer> get onInstanceUpdatedStream =>
      _onInstanceUpdatedStreamController.stream;

  /// Returns an appropriate [NSAppearanceName] depending on the provided
  /// [BuildContext].
  NSAppearanceName _getNSAppearanceNameFromBuildContext(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final highContrast = mediaQueryData.highContrast;
    final brightness = mediaQueryData.platformBrightness;

    if (highContrast) {
      switch (brightness) {
        case Brightness.dark:
          return NSAppearanceName.accessibilityHighContrastDarkAqua;
        case Brightness.light:
          return NSAppearanceName.accessibilityHighContrastAqua;
      }
    }

    switch (brightness) {
      case Brightness.dark:
        return NSAppearanceName.darkAqua;
      case Brightness.light:
        return NSAppearanceName.aqua;
    }
  }

  /// Generates a new [UiElementColorContainer] and updates the current
  /// [instance] if a change is detected.
  @override
  Future<void> maybeUpdate(BuildContext context) async {
    final appearanceName = nsAppearanceNameOverride ??
        _getNSAppearanceNameFromBuildContext(context);
    final newUiElementColorContainer =
        await UiElementColorContainer.generate(appearanceName);

    if (newUiElementColorContainer != _instance) {
      _instance = newUiElementColorContainer;
      _onInstanceUpdatedStreamController.add(newUiElementColorContainer);
    }
  }

  /// TODO: document this
  @override
  MediaQueryDataRegistration registerMediaQueryData(
    MediaQueryData mediaQueryData,
  ) {
    return MediaQueryDataRegistration.create();
  }

  /// TODO: document this
  @override
  void deregisterMediaQueryData(MediaQueryDataRegistration registration) {}
}
