//
//  NSColorNameToColorConverter.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 06.03.23.
//

import Foundation

class NSColorNameToColorConverter {
  static public func convert(_ name: String) -> NSColor {
    switch (name) {
    // Label Colors
    case "labelColor":
      return .labelColor

    case "secondaryLabelColor":
      return .secondaryLabelColor

    case "tertiaryLabelColor":
      return .tertiaryLabelColor

    case "quaternaryLabelColor":
      return .quaternaryLabelColor

    // Text Colors
    case "textColor":
      return .textColor

    case "placeholderTextColor":
      return .placeholderTextColor

    case "selectedTextColor":
      return .selectedTextColor

    case "textBackgroundColor":
      return .textBackgroundColor

    case "selectedTextBackgroundColor":
      return .selectedTextBackgroundColor

    case "keyboardFocusIndicatorColor":
      return .keyboardFocusIndicatorColor

    case "unemphasizedSelectedTextColor":
      return .unemphasizedSelectedTextColor

    case "unemphasizedSelectedTextBackgroundColor":
      return .unemphasizedSelectedTextBackgroundColor

    // Content Colors
    case "linkColor":
      return .linkColor

    case "separatorColor":
      return .separatorColor

    case "selectedContentBackgroundColor":
      return .selectedContentBackgroundColor

    case "unemphasizedSelectedContentBackgroundColor":
      return .unemphasizedSelectedContentBackgroundColor

    // Menu Colors
    case "selectedMenuItemTextColor":
      return .selectedMenuItemTextColor

    // Table Colors
    case "gridColor":
      return .gridColor

    case "headerTextColor":
      return .headerTextColor

    // `alternatingContentBackgroundColors` is a List of colors. Therefore, append “0” or “1” to access the individual elements.
    case "alternatingContentBackgroundColors0":
      return .alternatingContentBackgroundColors.first!
    
    case "alternatingContentBackgroundColors1":
      return .alternatingContentBackgroundColors.last!

    // Control Colors
    case "controlAccentColor":
      return .controlAccentColor

    case "controlColor":
      return .controlColor

    case "controlBackgroundColor":
      return .controlBackgroundColor
    case "controlTextColor":
      return .controlTextColor

    case "disabledControlTextColor":
      return .disabledControlTextColor

    // not an `NSColor`
    // case "currentControlTint":
    //  return .currentControlTint

    case "selectedControlColor":
      return .selectedControlColor
    case "selectedControlTextColor":
      return .selectedControlTextColor
    case "alternateSelectedControlTextColor":
      return .alternateSelectedControlTextColor

    case "scrubberTexturedBackground":
      return .scrubberTexturedBackground

    // Window Colors
    case "windowBackgroundColor":
      return .windowBackgroundColor

    case "windowFrameTextColor":
      return .windowFrameTextColor

    case "underPageBackgroundColor":
      return .underPageBackgroundColor

    // Highlights and Shadows
    case "findHighlightColor":
      return .findHighlightColor

    case "highlightColor":
      return .highlightColor

    case "shadowColor":
      return .shadowColor
      
    
    default:
      return .clear
    }
  }
}
