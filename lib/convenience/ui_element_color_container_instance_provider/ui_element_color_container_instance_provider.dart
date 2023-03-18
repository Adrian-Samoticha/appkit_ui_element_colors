import 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class UiElementColorContainerInstanceProvider {
  /// The [UiElementColorContainer] instance.
  UiElementColorContainer? get instance;

  /// A stream that can be used to listen for changes to [instance].
  Stream<UiElementColorContainer> get onInstanceUpdatedStream;

  /// Generates a new [UiElementColorContainer] and updates the current
  /// [instance] if a change is detected.
  Future<void> maybeUpdate(BuildContext context);

  /// Registers a [MediaQueryData] object to this
  /// [UiElementColorContainerInstanceProvider].
  MediaQueryDataRegistration registerMediaQueryData(
    MediaQueryData mediaQueryData,
  );

  /// Deregisters a [MediaQueryData] object from this
  /// [UiElementColorContainerInstanceProvider].
  void deregisterMediaQueryData(MediaQueryDataRegistration registration);
}

/// A media query data registration.
class MediaQueryDataRegistration extends Equatable {
  /// This [MediaQueryDataRegistration]’s ID.
  final int id;

  /// The id of the next [MediaQueryDataRegistration] to be created.
  static int nextId = 0;

  const MediaQueryDataRegistration._(this.id);

  /// Creates a new [MediaQueryDataRegistration].
  factory MediaQueryDataRegistration.create() {
    final newInstanceId = nextId;
    nextId += 1;

    return MediaQueryDataRegistration._(newInstanceId);
  }

  @override
  List<Object?> get props => [id];
}
