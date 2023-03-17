import 'dart:ui';

import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';

import 'package:equatable/equatable.dart';

/// A convenience class that contains all
/// [UI Element Colors](https://developer.apple.com/documentation/appkit/nscolor/ui_element_colors).
class UiElementColorContainer extends Equatable {
  /// Creates a [UiElementColorContainer] with the specified values.
  const UiElementColorContainer._({
    required this.labelColor,
    required this.secondaryLabelColor,
    required this.tertiaryLabelColor,
    required this.quaternaryLabelColor,
    required this.textColor,
    required this.placeholderTextColor,
    required this.selectedTextColor,
    required this.textBackgroundColor,
    required this.selectedTextBackgroundColor,
    required this.keyboardFocusIndicatorColor,
    required this.unemphasizedSelectedTextColor,
    required this.unemphasizedSelectedTextBackgroundColor,
    required this.linkColor,
    required this.separatorColor,
    required this.selectedContentBackgroundColor,
    required this.unemphasizedSelectedContentBackgroundColor,
    required this.selectedMenuItemTextColor,
    required this.gridColor,
    required this.headerTextColor,
    required this.alternatingContentBackgroundColors0,
    required this.alternatingContentBackgroundColors1,
    required this.controlAccentColor,
    required this.controlColor,
    required this.controlBackgroundColor,
    required this.controlTextColor,
    required this.disabledControlTextColor,
    required this.currentControlTint,
    required this.selectedControlColor,
    required this.selectedControlTextColor,
    required this.alternateSelectedControlTextColor,
    required this.scrubberTexturedBackground,
    required this.windowBackgroundColor,
    required this.windowFrameTextColor,
    required this.underPageBackgroundColor,
    required this.findHighlightColor,
    required this.highlightColor,
    required this.shadowColor,
  });

  /// Fetches the UI Element Colors from the Swift side and creates a
  /// [UiElementColorContainer] out of them.
  static Future<UiElementColorContainer> generate(
    NSAppearanceName appearance,
  ) async {
    return UiElementColorContainer._(
      labelColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.labelColor,
        appearance: appearance,
      ),
      secondaryLabelColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.secondaryLabelColor,
        appearance: appearance,
      ),
      tertiaryLabelColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.tertiaryLabelColor,
        appearance: appearance,
      ),
      quaternaryLabelColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.quaternaryLabelColor,
        appearance: appearance,
      ),
      textColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.textColor,
        appearance: appearance,
      ),
      placeholderTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.placeholderTextColor,
        appearance: appearance,
      ),
      selectedTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedTextColor,
        appearance: appearance,
      ),
      textBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.textBackgroundColor,
        appearance: appearance,
      ),
      selectedTextBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedTextBackgroundColor,
        appearance: appearance,
      ),
      keyboardFocusIndicatorColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.keyboardFocusIndicatorColor,
        appearance: appearance,
      ),
      unemphasizedSelectedTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.unemphasizedSelectedTextColor,
        appearance: appearance,
      ),
      unemphasizedSelectedTextBackgroundColor:
          await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.unemphasizedSelectedTextBackgroundColor,
        appearance: appearance,
      ),
      linkColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.linkColor,
        appearance: appearance,
      ),
      separatorColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.separatorColor,
        appearance: appearance,
      ),
      selectedContentBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedContentBackgroundColor,
        appearance: appearance,
      ),
      unemphasizedSelectedContentBackgroundColor:
          await AppkitUiElementColors.getColor(
        uiElementColor:
            UiElementColor.unemphasizedSelectedContentBackgroundColor,
        appearance: appearance,
      ),
      selectedMenuItemTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedMenuItemTextColor,
        appearance: appearance,
      ),
      gridColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.gridColor,
        appearance: appearance,
      ),
      headerTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.headerTextColor,
        appearance: appearance,
      ),
      alternatingContentBackgroundColors0: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.alternatingContentBackgroundColors0,
        appearance: appearance,
      ),
      alternatingContentBackgroundColors1: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.alternatingContentBackgroundColors1,
        appearance: appearance,
      ),
      controlAccentColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.controlAccentColor,
        appearance: appearance,
      ),
      controlColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.controlColor,
        appearance: appearance,
      ),
      controlBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.controlBackgroundColor,
        appearance: appearance,
      ),
      controlTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.controlTextColor,
        appearance: appearance,
      ),
      disabledControlTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.disabledControlTextColor,
        appearance: appearance,
      ),
      currentControlTint: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.currentControlTint,
        appearance: appearance,
      ),
      selectedControlColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedControlColor,
        appearance: appearance,
      ),
      selectedControlTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.selectedControlTextColor,
        appearance: appearance,
      ),
      alternateSelectedControlTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.alternateSelectedControlTextColor,
        appearance: appearance,
      ),
      scrubberTexturedBackground: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.scrubberTexturedBackground,
        appearance: appearance,
      ),
      windowBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.windowBackgroundColor,
        appearance: appearance,
      ),
      windowFrameTextColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.windowFrameTextColor,
        appearance: appearance,
      ),
      underPageBackgroundColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.underPageBackgroundColor,
        appearance: appearance,
      ),
      findHighlightColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.findHighlightColor,
        appearance: appearance,
      ),
      highlightColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.highlightColor,
        appearance: appearance,
      ),
      shadowColor: await AppkitUiElementColors.getColor(
        uiElementColor: UiElementColor.shadowColor,
        appearance: appearance,
      ),
    );
  }

  // === Label Colors ===

  /// The primary color to use for text labels.
  final Color labelColor;

  /// The secondary color to use for text labels.
  final Color secondaryLabelColor;

  /// The tertiary color to use for text labels.
  final Color tertiaryLabelColor;

  /// The quaternary color to use for text labels and separators.
  final Color quaternaryLabelColor;

  // === Text Colors ===

  /// The color to use for text.
  final Color textColor;

  /// The color to use for placeholder text in controls or text views.
  final Color placeholderTextColor;

  /// The color to use for selected text.
  final Color selectedTextColor;

  /// The color to use for the background area behind text.
  final Color textBackgroundColor;

  /// The color to use for the background of selected text.
  final Color selectedTextBackgroundColor;

  /// The color to use for the keyboard focus ring around controls.
  final Color keyboardFocusIndicatorColor;

  /// The color to use for selected text in an unemphasized context.
  final Color unemphasizedSelectedTextColor;

  /// The color to use for the text background in an unemphasized context.
  final Color unemphasizedSelectedTextBackgroundColor;

  // === Content Colors ===

  /// The color to use for links.
  final Color linkColor;

  /// The color to use for separators between different sections of content.
  final Color separatorColor;

  /// The color to use for the background of selected and emphasized content.
  final Color selectedContentBackgroundColor;

  /// The color to use for selected and unemphasized content.
  final Color unemphasizedSelectedContentBackgroundColor;

  // === Menu Colors ===

  /// The color to use for the text in menu items.
  final Color selectedMenuItemTextColor;

  // === Table Colors ===

  /// The color to use for the optional gridlines, such as those in a table
  /// view.
  final Color gridColor;

  /// The color to use for text in header cells in table views and outline
  /// views.
  final Color headerTextColor;

  /// The colors to use for alternating content, typically found in table views
  /// and collection views.
  final Color alternatingContentBackgroundColors0;

  /// The colors to use for alternating content, typically found in table views
  /// and collection views.
  final Color alternatingContentBackgroundColors1;

  // === Control Colors ===

  /// The user's current accent color preference.
  final Color controlAccentColor;

  /// The color to use for the flat surfaces of a control.
  final Color controlColor;

  /// The color to use for the background of large controls, such as scroll
  /// views or table views.
  final Color controlBackgroundColor;

  /// The color to use for text on enabled controls.
  final Color controlTextColor;

  /// The color to use for text on disabled controls.
  final Color disabledControlTextColor;

  /// The current system control tint color.
  final Color currentControlTint;

  /// The color to use for the face of a selected control—that is, a control
  /// that has been clicked or is being dragged.
  final Color selectedControlColor;

  /// The color to use for text in a selected control—that is, a control being
  /// clicked or dragged.
  final Color selectedControlTextColor;

  /// The color to use for text in a selected control.
  final Color alternateSelectedControlTextColor;

  /// The patterned color to use for the background of a scrubber control.
  final Color scrubberTexturedBackground;

  // === Window Colors ===

  /// The color to use for the window background.
  final Color windowBackgroundColor;

  /// The color to use for text in a window's frame.
  final Color windowFrameTextColor;

  /// The color to use in the area beneath your window's views.
  final Color underPageBackgroundColor;

  // === Highlights and Shadows ===

  /// The highlight color to use for the bubble that shows inline search result
  /// values.
  final Color findHighlightColor;

  /// The color to use as a virtual light source on the screen.
  final Color highlightColor;

  /// The color to use for virtual shadows cast by raised objects on the screen.
  final Color shadowColor;

  Color getColorFromUiElementColor(UiElementColor uiElementColor) {
    switch (uiElementColor) {
      case UiElementColor.labelColor:
        return labelColor;

      case UiElementColor.secondaryLabelColor:
        return secondaryLabelColor;

      case UiElementColor.tertiaryLabelColor:
        return tertiaryLabelColor;

      case UiElementColor.quaternaryLabelColor:
        return quaternaryLabelColor;

      case UiElementColor.textColor:
        return textColor;

      case UiElementColor.placeholderTextColor:
        return placeholderTextColor;

      case UiElementColor.selectedTextColor:
        return selectedTextColor;

      case UiElementColor.textBackgroundColor:
        return textBackgroundColor;

      case UiElementColor.selectedTextBackgroundColor:
        return selectedTextBackgroundColor;

      case UiElementColor.keyboardFocusIndicatorColor:
        return keyboardFocusIndicatorColor;

      case UiElementColor.unemphasizedSelectedTextColor:
        return unemphasizedSelectedTextColor;

      case UiElementColor.unemphasizedSelectedTextBackgroundColor:
        return unemphasizedSelectedTextBackgroundColor;

      case UiElementColor.linkColor:
        return linkColor;

      case UiElementColor.separatorColor:
        return separatorColor;

      case UiElementColor.selectedContentBackgroundColor:
        return selectedContentBackgroundColor;

      case UiElementColor.unemphasizedSelectedContentBackgroundColor:
        return unemphasizedSelectedContentBackgroundColor;

      case UiElementColor.selectedMenuItemTextColor:
        return selectedMenuItemTextColor;

      case UiElementColor.gridColor:
        return gridColor;

      case UiElementColor.headerTextColor:
        return headerTextColor;

      case UiElementColor.alternatingContentBackgroundColors0:
        return alternatingContentBackgroundColors0;

      case UiElementColor.alternatingContentBackgroundColors1:
        return alternatingContentBackgroundColors1;

      case UiElementColor.controlAccentColor:
        return controlAccentColor;

      case UiElementColor.controlColor:
        return controlColor;

      case UiElementColor.controlBackgroundColor:
        return controlBackgroundColor;

      case UiElementColor.controlTextColor:
        return controlTextColor;

      case UiElementColor.disabledControlTextColor:
        return disabledControlTextColor;

      case UiElementColor.currentControlTint:
        return currentControlTint;

      case UiElementColor.selectedControlColor:
        return selectedControlColor;

      case UiElementColor.selectedControlTextColor:
        return selectedControlTextColor;

      case UiElementColor.alternateSelectedControlTextColor:
        return alternateSelectedControlTextColor;

      case UiElementColor.scrubberTexturedBackground:
        return scrubberTexturedBackground;

      case UiElementColor.windowBackgroundColor:
        return windowBackgroundColor;

      case UiElementColor.windowFrameTextColor:
        return windowFrameTextColor;

      case UiElementColor.underPageBackgroundColor:
        return underPageBackgroundColor;

      case UiElementColor.findHighlightColor:
        return findHighlightColor;

      case UiElementColor.highlightColor:
        return highlightColor;

      case UiElementColor.shadowColor:
        return shadowColor;
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    final strings = UiElementColor.values
        .map((e) => '$e: ${getColorFromUiElementColor(e)}');
    buffer.writeAll(strings, ', ');

    return buffer.toString();
  }

  @override
  List<Object?> get props => [
        labelColor,
        secondaryLabelColor,
        tertiaryLabelColor,
        quaternaryLabelColor,
        textColor,
        placeholderTextColor,
        selectedTextColor,
        textBackgroundColor,
        selectedTextBackgroundColor,
        keyboardFocusIndicatorColor,
        unemphasizedSelectedTextColor,
        unemphasizedSelectedTextBackgroundColor,
        linkColor,
        separatorColor,
        selectedContentBackgroundColor,
        unemphasizedSelectedContentBackgroundColor,
        selectedMenuItemTextColor,
        gridColor,
        headerTextColor,
        alternatingContentBackgroundColors0,
        alternatingContentBackgroundColors1,
        controlAccentColor,
        controlColor,
        controlBackgroundColor,
        controlTextColor,
        disabledControlTextColor,
        currentControlTint,
        selectedControlColor,
        selectedControlTextColor,
        alternateSelectedControlTextColor,
        scrubberTexturedBackground,
        windowBackgroundColor,
        windowFrameTextColor,
        underPageBackgroundColor,
        findHighlightColor,
        highlightColor,
        shadowColor,
      ];
}
