//
//  SystemColorObserver.swift
//  appkit_ui_element_colors
//
//  Created by Adrian Samoticha on 11.03.23.
//

import Foundation
import FlutterMacOS

// TODO: document this
public class SystemColorObserver {
  private var methodChannel: FlutterMethodChannel?
  private var systemColorsDidChangeObserver: NSObjectProtocol?
  
  public static var shared: SystemColorObserver?
  
  public static func create(methodChannel: FlutterMethodChannel) -> SystemColorObserver {
    let newSystemColorObserver = SystemColorObserver()
    newSystemColorObserver.methodChannel = methodChannel
    newSystemColorObserver.systemColorsDidChangeObserver = NotificationCenter.default.addObserver(forName: NSColor.systemColorsDidChangeNotification, object: nil, queue: nil) { (_) in
      newSystemColorObserver.systemColorsDidChange()
    }
    
    return newSystemColorObserver
  }
  
  public static func registerSharedInstance(_ newSharedInstance: SystemColorObserver) {
    shared = newSharedInstance
  }
  
  private func systemColorsDidChange() {
    methodChannel!.invokeMethod("systemColorsDidChange", arguments: nil)
  }
  
  public func removeObserver() {
    NotificationCenter.default.removeObserver(systemColorsDidChangeObserver!)
  }
}
