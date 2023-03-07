//
//  NSColorComponents.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 06.03.23.
//

import Foundation

/// An enum containing all components of the `NSColor` class whose type is a `CGFloat`.
enum NSColorComponent {
  case alphaComponent
  case whiteComponent
  case redComponent
  case greenComponent
  case blueComponent
  case cyanComponent
  case magentaComponent
  case yellowComponent
  case blackComponent
  case hueComponent
  case brightnessComponent
  
  static public func fromString(_ name: String) -> NSColorComponent? {
    switch (name) {
    case "alphaComponent":
      return .alphaComponent

    case "whiteComponent":
      return .whiteComponent

    case "redComponent":
      return .redComponent

    case "greenComponent":
      return .greenComponent

    case "blueComponent":
      return .blueComponent

    case "cyanComponent":
      return .cyanComponent

    case "magentaComponent":
      return .magentaComponent

    case "yellowComponent":
      return .yellowComponent

    case "blackComponent":
      return .blackComponent

    case "hueComponent":
      return .hueComponent

    case "brightnessComponent":
      return .brightnessComponent
      
    default:
      return nil
    }
  }
  
  public func toName() -> String {
    switch (self) {
    case .alphaComponent:
      return "alphaComponent"

    case .whiteComponent:
      return "whiteComponent"

    case .redComponent:
      return "redComponent"

    case .greenComponent:
      return "greenComponent"

    case .blueComponent:
      return "blueComponent"

    case .cyanComponent:
      return "cyanComponent"

    case .magentaComponent:
      return "magentaComponent"

    case .yellowComponent:
      return "yellowComponent"

    case .blackComponent:
      return "blackComponent"

    case .hueComponent:
      return "hueComponent"

    case .brightnessComponent:
      return "brightnessComponent"
    }
  }
    
  public func toValueForColor(_ color: NSColor) -> CGFloat {
    switch (self) {
    case .alphaComponent:
      return color.alphaComponent

    case .whiteComponent:
      return color.whiteComponent

    case .redComponent:
      return color.redComponent

    case .greenComponent:
      return color.greenComponent

    case .blueComponent:
      return color.blueComponent

    case .cyanComponent:
      return color.cyanComponent

    case .magentaComponent:
      return color.magentaComponent

    case .yellowComponent:
      return color.yellowComponent

    case .blackComponent:
      return color.blackComponent

    case .hueComponent:
      return color.hueComponent

    case .brightnessComponent:
      return color.brightnessComponent
    }
  }
}
