#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appkit_ui_element_colors.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'appkit_ui_element_colors'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin that exposes AppKit’s “UI Element Colors.”'
  s.description      = <<-DESC
A Flutter plugin that exposes AppKit’s “UI Element Colors” to facilitate the
retrival of standard color objects for use with windows, controls, labels, text,
selections and other content in your app.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Adrian Samoticha' => 'adrian@samoticha.de' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
# TODO: complete this