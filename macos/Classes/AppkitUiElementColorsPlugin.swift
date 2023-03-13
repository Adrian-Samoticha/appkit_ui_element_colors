import Cocoa
import FlutterMacOS

public class AppkitUiElementColorsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "appkit_ui_element_colors", binaryMessenger: registrar.messenger)
    let instance = AppkitUiElementColorsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let systemColorsDidChangeMethodChannel = FlutterMethodChannel(name: "appkit_ui_element_colors/system_colors_did_change", binaryMessenger: registrar.messenger)
    let systemColorObserver = SystemColorObserver.create(methodChannel: systemColorsDidChangeMethodChannel)
    SystemColorObserver.registerSharedInstance(systemColorObserver)
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
      
      let appearanceAsString = args["appearance"] as! String
      let appearance = NSAppearanceNameToAppearanceConverter.convert(appearanceAsString)
      
      var colorUsingRequestedColorSpace: NSColor?
      if #available(macOS 11.0, *) {
        appearance?.performAsCurrentDrawingAppearance {
          colorUsingRequestedColorSpace = color.usingColorSpace(colorSpace!)
        }
      } else {
        colorUsingRequestedColorSpace = color.usingColorSpace(colorSpace!)
      }
      
      let dictionary = NSColorToDictionaryConverter.convert(color: colorUsingRequestedColorSpace!, components: components)
      
      result(dictionary)
      
    case "getColor":
      let colorName = args["uiElementColor"] as! String
      let color = NSColorNameToColorConverter.convert(colorName)
      
      let appearanceAsString = args["appearance"] as! String
      let appearance = NSAppearanceNameToAppearanceConverter.convert(appearanceAsString)
      
      var colorUsingSRGBColorSpace: NSColor?
      if #available(macOS 11.0, *) {
        appearance?.performAsCurrentDrawingAppearance {
          colorUsingSRGBColorSpace = color.usingColorSpace(.deviceRGB)
        }
      } else {
        colorUsingSRGBColorSpace = color.usingColorSpace(.deviceRGB)
      }
      
      // `NSColor.scrubberTexturedBackground` cannot be converted into `NSColorSpace.deviceRGB` color space. Therefore, return a transparent color instead.
      if (colorUsingSRGBColorSpace == nil) {
        result(0x00000000)
        
        return;
      }
      
      let hash = NSColorToHashConverter.convert(colorUsingSRGBColorSpace!)
      result(hash)
        
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
