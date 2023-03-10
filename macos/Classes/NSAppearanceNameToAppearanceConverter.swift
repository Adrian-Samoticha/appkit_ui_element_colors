//
//  NSAppearanceNameToAppearanceConverter.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 10.03.23.
//

import Foundation

class NSAppearanceNameToAppearanceConverter {
  public static func convert(_ name: String) -> NSAppearance? {
    switch (name) {
    case "aqua":
      return NSAppearance(named: .aqua)

    case "darkAqua":
      return NSAppearance(named: .darkAqua)

    case "vibrantLight":
      return NSAppearance(named: .vibrantLight)

    case "vibrantDark":
      return NSAppearance(named: .vibrantDark)

    case "accessibilityHighContrastAqua":
      return NSAppearance(named: .accessibilityHighContrastAqua)

    case "accessibilityHighContrastDarkAqua":
      return NSAppearance(named: .accessibilityHighContrastDarkAqua)

    case "accessibilityHighContrastVibrantLight":
      return NSAppearance(named: .accessibilityHighContrastVibrantLight)

    case "accessibilityHighContrastVibrantDark":
      return NSAppearance(named: .accessibilityHighContrastVibrantDark)
      
    default:
      return nil
    }
  }
}
