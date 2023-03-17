import 'dart:async';

import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';
import 'package:appkit_ui_element_colors/convenience/ui_element_color_container_instance_provider/ui_element_color_container_instance_provider.dart';
import 'package:flutter/widgets.dart';

/// Widget that builds itself based on a global shared [UiElementContainer]
/// instance provided by [SharedUiElementColorContainerInstanceProvider].
class UiElementColorBuilder extends StatefulWidget {
  /// Creates a [UiElementColorBuilder] that builds itself based on a global
  /// shared [UiElementContainer] instance.
  ///
  /// [errorBuilder] and [missingDataBuilder] may be null, in which case they
  /// are replaced with `const SizedBox()`.
  ///
  /// Example:
  ///
  /// ```dart
  /// UiElementColorBuilder(
  ///   builder: (context, colorContainer) => Container(
  ///     color: colorContainer.windowBackgroundColor,
  ///   ),
  /// );
  /// ```
  ///
  /// **Warning:** By default, [UiElementColorBuilder] uses a
  /// [SharedUiElementColorContainerInstanceProvider] to provide a global
  /// shared instance of [UiElementColorContainer].
  /// [SharedUiElementColorContainerInstanceProvider] uses an instance of
  /// [MediaQueryData] derived from the current [BuildContext] and assumes it to
  /// be the same across all [UiElementBuilder]s which use it.
  ///
  /// If your app contains surfaces with different [MediaQueryData] overrides,
  /// use [OwnedUiElementColorContainerInstanceProvider] instead:
  ///
  /// ```dart
  /// // A dark cupertino theme.
  /// CupertinoTheme(
  ///   data: const CupertinoThemeData(
  ///     brightness: Brightness.dark,
  ///   ),
  ///   // Override the MediaQueryData so that platformBrightness is dark.
  ///   child: MediaQuery(
  ///     data: MediaQuery.of(context).copyWith(
  ///       platformBrightness: Brightness.dark,
  ///     ),
  ///     child: UiElementColorBuilder(
  ///       // Since there may be surfaces within the app that do not override the
  ///       // brightness, use an OwnedUiElementColorContainerInstanceProvider.
  ///       uiElementColorContainerInstanceProvider:
  ///           OwnedUiElementColorContainerInstanceProvider(),
  ///       builder: (context, colorContainer) => Container(
  ///         color: colorContainer.windowBackgroundColor,
  ///       ),
  ///     ),
  ///   ),
  /// );
  /// ```
  const UiElementColorBuilder({
    super.key,
    this.uiElementColorContainerInstanceProvider =
        const SharedUiElementColorContainerInstanceProvider(),
    required this.builder,
    this.errorBuilder,
    this.missingDataBuilder,
  });

  /// The [UiElementColorContainerInstanceProvider] that provides the
  /// [UiElementColorContainer] to be used by this [UiElementColorBuilder].
  final UiElementColorContainerInstanceProvider
      uiElementColorContainerInstanceProvider;

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
  /// The stream subscription for the stream of the [SystemColorObserver].
  late StreamSubscription<void> _systemColorObserverStreamSubscription;

  @override
  void initState() {
    super.initState();
    _systemColorObserverStreamSubscription = AppkitUiElementColors
        .systemColorObserver.stream
        .listen((_) => widget.uiElementColorContainerInstanceProvider
            .maybeUpdate(context));
  }

  @override
  void dispose() {
    _systemColorObserverStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.uiElementColorContainerInstanceProvider.maybeUpdate(context);

    return StreamBuilder(
      initialData: widget.uiElementColorContainerInstanceProvider.instance,
      stream: widget
          .uiElementColorContainerInstanceProvider.onInstanceUpdatedStream,
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
