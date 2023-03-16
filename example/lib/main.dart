import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await AppkitUiElementColors.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

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

class _UiElementColorNameText extends StatelessWidget {
  const _UiElementColorNameText({
    required this.colorContainer,
    required this.uiElementColor,
  });

  final UiElementColorContainer colorContainer;
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

class _ColorHashText extends StatelessWidget {
  const _ColorHashText({
    required this.colorContainer,
    required this.uiElementColor,
  });

  final UiElementColorContainer colorContainer;
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

class _ColorPreview extends StatelessWidget {
  const _ColorPreview({
    required this.uiElementColor,
  });

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
