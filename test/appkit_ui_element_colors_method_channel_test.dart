import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appkit_ui_element_colors/appkit_ui_element_colors_method_channel.dart';

void main() {
  MethodChannelAppkitUiElementColors platform = MethodChannelAppkitUiElementColors();
  const MethodChannel channel = MethodChannel('appkit_ui_element_colors');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
