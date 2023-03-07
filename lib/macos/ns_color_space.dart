/// An object that represents a custom color space.
enum NSColorSpace {
  /// A color space object that represents a calibrated or device-dependent RGB
  /// color space.
  deviceRGB,

  /// A color space object that represents a device-independent RGB color space.
  genericRGB,

  /// A color space object that represents a calibrated or device-dependent CMYK
  /// color space.
  deviceCMYK,

  /// A color space object that represents a device-independent CMYK color
  /// space.
  genericCMYK,

  /// A color space object that represents a calibrated or device-dependent gray
  /// color space.
  deviceGray,

  /// A color space object that represents a device-independent gray color
  /// space.
  genericGray,

  /// A color space object that represents an sRGB color space.
  sRGB,

  /// A color space object that represents an extended sRGB color space.
  extendedSRGB,

  /// A color space object that represents a P3 Display color space.
  displayP3,

  /// A color space object that represents a gray color space with a gamma value
  /// of 2.2.
  genericGamma22Gray,

  /// A color space object that represents an extended gray color space with a
  /// gamma value of 2.2.
  extendedGenericGamma22Gray,

  /// A color space object that represents an Adobe RGB (1998) color space.
  adobeRGB1998,
}
