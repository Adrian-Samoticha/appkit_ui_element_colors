//
//  SystemColorObserver.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 11.03.23.
//

import Foundation
import FlutterMacOS

/// A class that observes changes to the system color.
public class SystemColorObserver {
  /// The Flutter method channel.
  private var methodChannel: FlutterMethodChannel?
  
  /// The observer returned by `NotificationCenter.default.addObserver`.
  private var systemColorsDidChangeObserver: NSObjectProtocol?
  
  /// A global shared SystemColorObserver instance.
  public static var shared: SystemColorObserver?
  
  /// Creates a new SystemColorObserver with a provided Flutter method channel.
  public static func create(methodChannel: FlutterMethodChannel) -> SystemColorObserver {
    let newSystemColorObserver = SystemColorObserver()
    newSystemColorObserver.methodChannel = methodChannel
    newSystemColorObserver.systemColorsDidChangeObserver = NotificationCenter.default.addObserver(forName: NSColor.systemColorsDidChangeNotification, object: nil, queue: nil) { (_) in
      newSystemColorObserver.systemColorsDidChange()
    }
    
    return newSystemColorObserver
  }
  
  /// Sets the global shared instance.
  public static func registerSharedInstance(_ newSharedInstance: SystemColorObserver) {
    shared = newSharedInstance
  }
  
  /// This method gets called when a system color change is detected.
  private func systemColorsDidChange() {
    methodChannel!.invokeMethod("systemColorsDidChange", arguments: nil)
  }
  
  /// Removes the observer from the notification channel.
  public func removeObserver() {
    NotificationCenter.default.removeObserver(systemColorsDidChangeObserver!)
  }
}
