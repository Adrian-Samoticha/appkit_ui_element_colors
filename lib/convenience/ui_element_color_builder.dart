import 'package:appkit_ui_element_colors/convenience/ui_element_color_container_shared_instance_provider.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container.dart';

/// Widget that builds itself based on a global shared [UiElementContainer]
/// instance provided by [UiElementColorContainerSharedInstanceProvider].
class UiElementColorBuilder extends StatefulWidget {
  /// Creates a [UiElementColorBuilder] that builds itself based on a global
  /// shared [UiElementContainer] instance.
  ///
  /// [errorBuilder] and [missingDataBuilder] may be null, in which case they
  /// are replaced with `const SizedBox()`.
  ///
  /// Example:
  /// ```dart
  /// UiElementColorBuilder(
  ///   builder: (context, colorContainer) => Container(
  ///     color: colorContainer.windowBackgroundColor,
  ///   ),
  /// );
  /// ```
  const UiElementColorBuilder({
    super.key,
    required this.builder,
    this.errorBuilder,
    this.missingDataBuilder,
  });

  /// Called at build time to construct a widget tree.
  final Widget Function(BuildContext, UiElementColorContainer) builder;

  /// Called when an error is encountered.
  final Widget Function(BuildContext, Object?)? errorBuilder;

  /// Called when there is currently no [UiElementContainer] available.
  final Widget Function(BuildContext)? missingDataBuilder;

  @override
  State<UiElementColorBuilder> createState() => _UiElementColorBuilderState();
}

class _UiElementColorBuilderState extends State<UiElementColorBuilder> {
  @override
  Widget build(BuildContext context) {
    UiElementColorContainerSharedInstanceProvider.maybeUpdate(context);

    return StreamBuilder(
      initialData: UiElementColorContainerSharedInstanceProvider.sharedInstance,
      stream: UiElementColorContainerSharedInstanceProvider
          .onSharedInstanceUpdatedStream,
      builder: (context, data) {
        if (!data.hasData) {
          return widget.missingDataBuilder != null
              ? widget.missingDataBuilder!(context)
              : const SizedBox();
        }

        if (data.hasError) {
          return widget.errorBuilder != null
              ? widget.errorBuilder!(context, data.error)
              : const SizedBox();
        }

        return widget.builder(context, data.data!);
      },
    );
  }
}
