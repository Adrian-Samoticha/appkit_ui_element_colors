/// An enum containing all `NSColor`s listed in
/// [UI Element Colors](https://developer.apple.com/documentation/appkit/nscolor/ui_element_colors).
enum UiElementColor {
  // === Label Colors ===

  /// The primary color to use for text labels.
  labelColor,

  /// The secondary color to use for text labels.
  secondaryLabelColor,

  /// The tertiary color to use for text labels.
  tertiaryLabelColor,

  /// The quaternary color to use for text labels and separators.
  quaternaryLabelColor,

  // === Text Colors ===

  /// The color to use for text.
  textColor,

  /// The color to use for placeholder text in controls or text views.
  placeholderTextColor,

  /// The color to use for selected text.
  selectedTextColor,

  /// The color to use for the background area behind text.
  textBackgroundColor,

  /// The color to use for the background of selected text.
  selectedTextBackgroundColor,

  /// The color to use for the keyboard focus ring around controls.
  keyboardFocusIndicatorColor,

  /// The color to use for selected text in an unemphasized context.
  unemphasizedSelectedTextColor,

  /// The color to use for the text background in an unemphasized context.
  unemphasizedSelectedTextBackgroundColor,

  // === Content Colors ===

  /// The color to use for links.
  linkColor,

  /// The color to use for separators between different sections of content.
  separatorColor,

  /// The color to use for the background of selected and emphasized content.
  selectedContentBackgroundColor,

  /// The color to use for selected and unemphasized content.
  unemphasizedSelectedContentBackgroundColor,

  // === Menu Colors ===

  /// The color to use for the text in menu items.
  selectedMenuItemTextColor,

  // === Table Colors ===

  /// The color to use for the optional gridlines, such as those in a table
  /// view.
  gridColor,

  /// The color to use for text in header cells in table views and outline
  /// views.
  headerTextColor,

  /// The colors to use for alternating content, typically found in table views
  /// and collection views.
  alternatingContentBackgroundColors0,

  /// The colors to use for alternating content, typically found in table views
  /// and collection views.
  alternatingContentBackgroundColors1,

  // === Control Colors ===

  /// The user's current accent color preference.
  controlAccentColor,

  /// The color to use for the flat surfaces of a control.
  controlColor,

  /// The color to use for the background of large controls, such as scroll
  /// views or table views.
  controlBackgroundColor,

  /// The color to use for text on enabled controls.
  controlTextColor,

  /// The color to use for text on disabled controls.
  disabledControlTextColor,

  /// The current system control tint color.
  currentControlTint,

  /// The color to use for the face of a selected control—that is, a control
  /// that has been clicked or is being dragged.
  selectedControlColor,

  /// The color to use for text in a selected control—that is, a control being
  /// clicked or dragged.
  selectedControlTextColor,

  /// The color to use for text in a selected control.
  alternateSelectedControlTextColor,

  /// The patterned color to use for the background of a scrubber control.
  scrubberTexturedBackground,

  // === Window Colors ===

  /// The color to use for the window background.
  windowBackgroundColor,

  /// The color to use for text in a window's frame.
  windowFrameTextColor,

  /// The color to use in the area beneath your window's views.
  underPageBackgroundColor,

  // === Highlights and Shadows ===

  /// The highlight color to use for the bubble that shows inline search result
  /// values.
  findHighlightColor,

  /// The color to use as a virtual light source on the screen.
  highlightColor,

  /// The color to use for virtual shadows cast by raised objects on the screen.
  shadowColor,
}
