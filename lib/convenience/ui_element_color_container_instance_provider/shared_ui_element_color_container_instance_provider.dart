import 'dart:async';
import 'dart:ui';

import 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
import 'package:appkit_ui_element_colors/macos/ns_appearance_name.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container_instance_provider.dart';

/// A class that provides a global instance of [UiElementColorContainer].
///
/// [sharedInstance] is initially `null` until [maybeUpdate] is called for the
/// first time.
class SharedUiElementColorContainerInstanceProvider
    implements UiElementColorContainerInstanceProvider {
  /// Creates a [SharedUiElementColorContainerInstanceProvider], a class that
  /// provides a global instance of [UiElementColorContainer].
  const SharedUiElementColorContainerInstanceProvider();

  /// The global shared instance of [UiElementColorContainer].
  static UiElementColorContainer? _sharedInstance;

  /// A stream controller for the “on shared instance updated” stream.
  static final _onSharedInstanceUpdatedStreamController =
      StreamController<UiElementColorContainer>.broadcast();

  static final _mediaQueryDataRegistrations =
      <MediaQueryDataRegistration, MediaQueryData>{};

  /// The global shared instance of [UiElementColorContainer].
  @override
  UiElementColorContainer? get instance => _sharedInstance;

  /// A stream that can be used to listen for [sharedInstance] changes.
  @override
  Stream<UiElementColorContainer> get onInstanceUpdatedStream =>
      _onSharedInstanceUpdatedStreamController.stream;

  /// Returns an appropriate [NSAppearanceName] depending on the provided
  /// [BuildContext].
  static NSAppearanceName _getNSAppearanceNameFromBuildContext(
    BuildContext context,
  ) {
    final highContrast = MediaQuery.of(context).highContrast;
    final brightness = MediaQuery.of(context).platformBrightness;

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
  /// [sharedInstance] if a change is detected.
  @override
  Future<void> maybeUpdate(BuildContext context) async {
    final appearanceName = _getNSAppearanceNameFromBuildContext(context);
    final newUiElementColorContainer =
        await UiElementColorContainer.generate(appearanceName);

    if (newUiElementColorContainer != _sharedInstance) {
      _sharedInstance = newUiElementColorContainer;
      _onSharedInstanceUpdatedStreamController.add(newUiElementColorContainer);
    }
  }

  /// Determines if [data] is conflicting with an already present
  /// [MediaQueryData] registration.
  bool _isMediaQueryDataConflicting(MediaQueryData data) {
    for (final other in _mediaQueryDataRegistrations.values) {
      if (other.platformBrightness != data.platformBrightness ||
          other.highContrast != data.highContrast) {
        return true;
      }
    }

    return false;
  }

  /// Adds [mediaQueryData] to [_mediaQueryDataRegistrations].
  ///
  /// Returns whether [mediaQueryData] is conflicting with an already active
  /// [MediaQueryData] registration.
  bool _addMediaQueryData(
    MediaQueryData mediaQueryData,
    MediaQueryDataRegistration registration,
  ) {
    final isConflicting = _isMediaQueryDataConflicting(mediaQueryData);
    _mediaQueryDataRegistrations[registration] = mediaQueryData;

    return isConflicting;
  }

  /// Registers a [MediaQueryData] object to this
  /// [SharedUiElementColorContainerInstanceProvider].
  ///
  /// In debug-mode, when a [MediaQueryData] object is registered that is
  /// conflicting with an already active [MediaQueryData] registration (that is,
  /// the colors generated using this [MediaQueryData] object may differ from
  /// one of the already present [MediaQueryData] registrations), an assertion
  /// error is thrown.
  ///
  /// In that case [OwnedUiElementColorContainerInstanceProvider] should be used
  /// instead.
  @override
  MediaQueryDataRegistration registerMediaQueryData(
    MediaQueryData mediaQueryData,
  ) {
    final registration = MediaQueryDataRegistration.create();

    assert(
        !_addMediaQueryData(mediaQueryData, registration),
        'Found conflicting MediaQueryData in '
        'SharedUiElementColorContainerInstanceProvider. If you are using '
        'UiElementColorBuilder within widget subtrees with differing '
        'MediaQueryData (such as different theme brightness or accessibility '
        'settings), please use OwnedUiElementColorContainerInstanceProvider, '
        'instead.');

    return registration;
  }

  /// Deregisters a [MediaQueryData] object from this
  /// [SharedUiElementColorContainerInstanceProvider].
  @override
  void deregisterMediaQueryData(MediaQueryDataRegistration registration) {
    _mediaQueryDataRegistrations.remove(registration);
  }
}
