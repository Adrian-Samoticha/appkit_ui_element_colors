//
//  ColorToDictionaryConverter.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 07.03.23.
//

import Foundation

/// A class that converts `NSColor` objects into dictionaries containing their individual components.
class NSColorToDictionaryConverter {
  /// Converts an `NSColor` to a dictionary containing the color’s `components`.
  public static func convert(color: NSColor, components: Array<NSColorComponent>) -> Dictionary<String, CGFloat> {
    return Dictionary(uniqueKeysWithValues: components.map { ($0.toName(), $0.toValueForColor(color)) })
  }
}
