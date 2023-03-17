import 'package:appkit_ui_element_colors/convenience/ui_element_color_container.dart';
import 'package:flutter/widgets.dart';

abstract class UiElementColorContainerInstanceProvider {
  /// The [UiElementColorContainer] instance.
  UiElementColorContainer? get instance;

  /// A stream that can be used to listen for changes to [instance].
  Stream<UiElementColorContainer> get onInstanceUpdatedStream;

  /// Generates a new [UiElementColorContainer] and updates the current
  /// [instance] if a change is detected.
  Future<void> maybeUpdate(BuildContext context);
}
