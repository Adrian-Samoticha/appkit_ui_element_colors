import 'package:appkit_ui_element_colors/convenience/ui_element_color_container_shared_instance_provider.dart';
import 'package:flutter/widgets.dart';

import 'ui_element_color_container.dart';

/// TODO: document this
class UiElementColorBuilder extends StatefulWidget {
  const UiElementColorBuilder({
    super.key,
    required this.builder,
    this.errorBuilder,
    this.missingDataBuilder,
  });

  final Widget Function(BuildContext, UiElementColorContainer) builder;
  final Widget Function(BuildContext, Object?)? errorBuilder;
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
