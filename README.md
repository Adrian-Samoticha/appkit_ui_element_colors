# appkit_ui_element_colors

A Flutter plugin that exposes AppKit’s [“UI Element Colors”](https://developer.apple.com/documentation/appkit/nscolor/ui_element_colors) to facilitate the
retrieval of standard color objects for use with windows, controls, labels, text,
selections and other content in your app.

## Screenshot of example project

<img width="678" alt="Screenshot 2023-03-19 at 12 36 03" src="https://user-images.githubusercontent.com/86920182/226172721-11429992-2a5c-4575-9d41-c8b14eab745d.png">

## Getting Started

Install this package:

```bash
flutter pub add appkit_ui_element_colors
```

Then import it in your Dart code:

```dart
import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';
```


## Features

### Retrieving UI element colors

The following colors are available:

<details>
<summary>Available UI Element colors</summary>

+ labelColor
+ secondaryLabelColor
+ tertiaryLabelColor
+ quaternaryLabelColor
+ textColor
+ placeholderTextColor
+ selectedTextColor
+ textBackgroundColor
+ selectedTextBackgroundColor
+ keyboardFocusIndicatorColor
+ unemphasizedSelectedTextColor
+ unemphasizedSelectedTextBackgroundColor
+ linkColor
+ separatorColor
+ selectedContentBackgroundColor
+ unemphasizedSelectedContentBackgroundColor
+ selectedMenuItemTextColor
+ gridColor
+ headerTextColor
+ alternatingContentBackgroundColors0
+ alternatingContentBackgroundColors1
+ controlAccentColor
+ controlColor
+ controlBackgroundColor
+ controlTextColor
+ disabledControlTextColor
+ currentControlTint
+ selectedControlColor
+ selectedControlTextColor
+ alternateSelectedControlTextColor
+ scrubberTexturedBackground
+ windowBackgroundColor
+ windowFrameTextColor
+ underPageBackgroundColor
+ findHighlightColor
+ highlightColor
+ shadowColor

</details>

Each color can be retrieved as a [`Color`](https://api.flutter.dev/flutter/dart-ui/Color-class.html) object using the `AppkitUiElementColors.getColor` method:

```dart
final darkWindowBackgroundColor = await AppkitUiElementColors.getColor(
  uiElementColor: UiElementColor.windowBackgroundColor,
  appearance: NSAppearanceName.darkAqua,
);
```

Alternatively, it can also be converted to any available `NSColorSpace` and retrieved as a map of requested `NSColorComponent`s using `AppkitUiElementColors.getColorComponents`:

```dart
final components = await AppkitUiElementColors.getColorComponents(
  uiElementColor: UiElementColor.selectedControlColor,
  components: {
    NSColorComponent.redComponent,
    NSColorComponent.greenComponent,
    NSColorComponent.blueComponent,
  },
  colorSpace: NSColorSpace.sRGB,
  appearance: NSAppearanceName.aqua,
);

// prints "{blueComponent: 0.7450980544090271, redComponent: 1.0, greenComponent: 0.9333333373069763}"
print(components);
```

### Observing system color changes

Certain events, such as the user changing their preferred accent color, can trigger system color changes. Such changes can be observed using the `SystemColorObserver` class. The `AppkitUiElementColors` class provides a global shared instance of `SystemColorObserver` that can be accessed as follows:

```dart
AppkitUiElementColors.systemColorObserver.stream
    .listen((_) => print('System colors changed.'));
```

### Building widgets using `UiElementColorBuilder`

The `UiElementColorBuilder` class provides a convenient way to build widgets that depend on UI element colors provided by **appkit_ui_element_colors**:

```dart
UiElementColorBuilder(
  builder: (context, colorContainer) => Container(
    color: colorContainer.windowBackgroundColor,
  ),
);
```

By default, `UiElementColorBuilder` uses a
`SharedUiElementColorContainerInstanceProvider` to provide a global
shared instance of `UiElementColorContainer`.
`SharedUiElementColorContainerInstanceProvider` uses an instance of
`MediaQueryData` derived from the current `BuildContext` and assumes it to
be the same across all `UiElementBuilder`s which use it.
If your app contains surfaces with different `MediaQueryData` overrides,
use `OwnedUiElementColorContainerInstanceProvider` instead:

```dart
// A dark cupertino theme.
CupertinoTheme(
  data: const CupertinoThemeData(
    brightness: Brightness.dark,
  ),
  // Override the MediaQueryData so that platformBrightness is dark.
  child: MediaQuery(
    data: MediaQuery.of(context).copyWith(
      platformBrightness: Brightness.dark,
    ),
    child: UiElementColorBuilder(
      // Since there may be surfaces within the app that do not override the
      // brightness, use an OwnedUiElementColorContainerInstanceProvider.
      uiElementColorContainerInstanceProvider:
          OwnedUiElementColorContainerInstanceProvider(),
      builder: (context, colorContainer) => Container(
        color: colorContainer.windowBackgroundColor,
      ),
    ),
  ),
);
```

Incorrect usage of `SharedUiElementColorContainerInstanceProvider` throws the following assertion error:

*“Found conflicting MediaQueryData in SharedUiElementColorContainerInstanceProvider. If you are using UiElementColorBuilder within widget subtrees with differing MediaQueryData (such as different theme brightness or accessibility settings), please use OwnedUiElementColorContainerInstanceProvider instead.”*