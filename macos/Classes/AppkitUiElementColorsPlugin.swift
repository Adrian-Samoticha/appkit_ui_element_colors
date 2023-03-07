import Cocoa
import FlutterMacOS

public class AppkitUiElementColorsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "appkit_ui_element_colors", binaryMessenger: registrar.messenger)
    let instance = AppkitUiElementColorsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  private static func convertColorToColorSpace(color: NSColor, colorSpace: NSColorSpace) -> NSColor {
    return color.usingColorSpace(colorSpace)!
  }
  
  private static func convertColorToDictionary(color: NSColor, components: Array<NSColorComponent>) -> Dictionary<String, CGFloat> {
    return Dictionary(uniqueKeysWithValues: components.map { ($0.toName(), $0.toValueForColor(color)) })
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args: [String: Any] = call.arguments as? [String: Any] ?? [:]
    
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        
    case "getColor":
      let colorName = args["uiElementColor"] as! String
      let color = NSColorNameToColorConverter.convert(colorName)
      
      let componentsAsStrings = args["components"] as! Array<String>
      let components: Array<NSColorComponent> = componentsAsStrings.map { NSColorComponent.fromString($0) ?? NSColorComponent.alphaComponent }
      
      let colorSpaceAsString = args["colorSpace"] as! String
      let colorSpace = NSColorSpaceNameToColorSpaceConverter.convert(colorSpaceAsString)
      
      let convertedColor = AppkitUiElementColorsPlugin.convertColorToColorSpace(color: color, colorSpace: colorSpace!)
      
      result(AppkitUiElementColorsPlugin.convertColorToDictionary(color: convertedColor, components: components))
        
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
