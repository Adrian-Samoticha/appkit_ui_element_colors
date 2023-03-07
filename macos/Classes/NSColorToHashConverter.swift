//
//  NSColorToHexCodeConverter.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 07.03.23.
//

import Foundation

/// A class that converts `NSColor`s into Dart’s hash syntax.
class NSColorToHashConverter {
  /// Converts an `NSColor` into Dart’s hash syntax (`0xAARRGGBB`).
  public static func convert(_ color: NSColor) -> Int {
    let alphaInt = Int(color.alphaComponent * 0xff)
    let redInt = Int(color.redComponent * 0xff)
    let greenInt = Int(color.greenComponent * 0xff)
    let blueInt = Int(color.blueComponent * 0xff)
    
    let hash = alphaInt << 24
             | redInt << 16
             | greenInt << 8
             | blueInt
    
    return hash
  }
}
