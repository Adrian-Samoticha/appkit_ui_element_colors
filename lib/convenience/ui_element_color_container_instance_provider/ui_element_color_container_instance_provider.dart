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

  /// TODO: document this
  MediaQueryDataRegistration registerMediaQueryData(
    MediaQueryData mediaQueryData,
  );

  /// TODO: document this
  void deregisterMediaQueryData(MediaQueryDataRegistration registration);
}

/// TODO: document this
class MediaQueryDataRegistration extends Equatable {
  final int id;
  static int nextId = 0;

  const MediaQueryDataRegistration._(this.id);

  factory MediaQueryDataRegistration.create() {
    final newInstanceId = nextId;
    nextId += 1;

    return MediaQueryDataRegistration._(newInstanceId);
  }

  @override
  List<Object?> get props => [id];
}
