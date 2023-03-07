import Cocoa
import FlutterMacOS

public class AppkitUiElementColorsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "appkit_ui_element_colors", binaryMessenger: registrar.messenger)
    let instance = AppkitUiElementColorsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args: [String: Any] = call.arguments as? [String: Any] ?? [:]
    
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        
    case "getColorComponents":
      let colorName = args["uiElementColor"] as! String
      let color = NSColorNameToColorConverter.convert(colorName)
      
      let componentsAsStrings = args["components"] as! Array<String>
      let components: Array<NSColorComponent> = componentsAsStrings.map { NSColorComponent.fromString($0) ?? NSColorComponent.alphaComponent }
      
      let colorSpaceAsString = args["colorSpace"] as! String
      let colorSpace = NSColorSpaceNameToColorSpaceConverter.convert(colorSpaceAsString)
      
      let colorUsingRequestedColorSpace = color.usingColorSpace(colorSpace!)
      let dictionary = NSColorToDictionaryConverter.convert(color: colorUsingRequestedColorSpace!, components: components)
      
      result(dictionary)
      
    case "getColor":
      let colorName = args["uiElementColor"] as! String
      let color = NSColorNameToColorConverter.convert(colorName)
      
      let colorUsingSRGBColorspace = color.usingColorSpace(.sRGB)
      
      let hash = NSColorToHashConverter.convert(colorUsingSRGBColorspace!)
      
      result(hash)
        
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
