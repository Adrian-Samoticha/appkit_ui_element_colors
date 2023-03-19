import 'package:flutter/cupertino.dart';

import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('appkit_ui_element_colors example'),
        ),
        child: _UiElementColorList(),
      ),
    );
  }
}

class _UiElementColorList extends StatelessWidget {
  const _UiElementColorList();

  @override
  Widget build(BuildContext context) {
    return UiElementColorBuilder(
      builder: (context, colorContainer) {
        return ListView.builder(
          itemCount: UiElementColor.values.length,
          itemBuilder: (context, index) {
            final uiElementColor = UiElementColor.values[index];

            return Container(
              color: index % 2 == 0
                  ? colorContainer.alternatingContentBackgroundColors0
                  : colorContainer.alternatingContentBackgroundColors1,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  _ColorPreview(
                    uiElementColor: colorContainer
                        .getColorFromUiElementColor(uiElementColor),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: _UiElementColorNameText(
                      colorContainer: colorContainer,
                      uiElementColor: uiElementColor,
                    ),
                  ),
                  _ColorHashText(
                    colorContainer: colorContainer,
                    uiElementColor: uiElementColor,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// A widget that displays the name of a [uiElementColor].
class _UiElementColorNameText extends StatelessWidget {
  /// Creates a [_UiElementColorNameText] for [uiElementColor].
  const _UiElementColorNameText({
    required this.colorContainer,
    required this.uiElementColor,
  });

  /// A color container, used to style the text.
  final UiElementColorContainer colorContainer;

  /// The color whose name text should be displayed.
  final UiElementColor uiElementColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      uiElementColor.name,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: colorContainer.textColor,
      ),
    );
  }
}

/// A widget that displays the hash text of a color.
class _ColorHashText extends StatelessWidget {
  /// Creates a [_ColorHashText] for [uiElementColor].
  const _ColorHashText({
    required this.colorContainer,
    required this.uiElementColor,
  });

  /// A color container, used to style the text.
  final UiElementColorContainer colorContainer;

  /// The color whose hash text should be displayed.
  final UiElementColor uiElementColor;

  @override
  Widget build(BuildContext context) {
    final text = colorContainer
        .getColorFromUiElementColor(uiElementColor)
        .value
        .toRadixString(16)
        .padLeft(8, '0');

    return Text(
      '#$text',
      style: TextStyle(
        color: colorContainer.textColor.withOpacity(0.5),
      ),
    );
  }
}

/// A widget that displays a square with a given color.
///
/// If the color is transparent, a checkerboard pattern will be displayed
/// underneath the square.
class _ColorPreview extends StatelessWidget {
  /// Creates a [_ColorPreview] with a specified UI element color.
  const _ColorPreview({
    required this.uiElementColor,
  });

  /// The color to preview.
  final Color uiElementColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      child: Stack(
        children: [
          Container(
            width: 8.0,
            height: 8.0,
            color: const Color.fromRGBO(0, 0, 0, 1.0),
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: 8.0,
              height: 8.0,
              color: const Color.fromRGBO(0, 0, 0, 1.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Color.fromRGBO(128, 128, 128, 1.0),
                ),
              ),
              color: uiElementColor,
            ),
            width: 16.0,
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
