//
//  CGColorSpaceNameToColorSpaceConverter.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 07.03.23.
//

import Foundation

/// A class that converts a `CGColorSpace` name into an `NSColorSpace` instance.
class NSColorSpaceNameToColorSpaceConverter {
  /// Creates an `NSColorSpace` from a given name.
  ///
  /// Returns `nil` if no `NSColorSpace` with the given name exists.
  static func convert(_ name: String) -> NSColorSpace? {
    switch (name) {
    case "deviceRGB":
      return .deviceRGB

    case "genericRGB":
      return .genericRGB

    case "deviceCMYK":
      return .deviceCMYK

    case "genericCMYK":
      return .genericCMYK

    case "deviceGray":
      return .deviceGray

    case "genericGray":
      return .genericGray

    case "sRGB":
      return .sRGB

    case "extendedSRGB":
      return .extendedSRGB

    case "displayP3":
      return .displayP3

    case "genericGamma22Gray":
      return .genericGamma22Gray

    case "extendedGenericGamma22Gray":
      return .extendedGenericGamma22Gray

    case "adobeRGB1998":
      return .adobeRGB1998

    default:
      return nil
    }
  }
}
