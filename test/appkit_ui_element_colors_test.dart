import 'package:flutter_test/flutter_test.dart';
import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';
import 'package:appkit_ui_element_colors/appkit_ui_element_colors_platform_interface.dart';
import 'package:appkit_ui_element_colors/appkit_ui_element_colors_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppkitUiElementColorsPlatform
    with MockPlatformInterfaceMixin
    implements AppkitUiElementColorsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppkitUiElementColorsPlatform initialPlatform = AppkitUiElementColorsPlatform.instance;

  test('$MethodChannelAppkitUiElementColors is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppkitUiElementColors>());
  });

  test('getPlatformVersion', () async {
    AppkitUiElementColors appkitUiElementColorsPlugin = AppkitUiElementColors();
    MockAppkitUiElementColorsPlatform fakePlatform = MockAppkitUiElementColorsPlatform();
    AppkitUiElementColorsPlatform.instance = fakePlatform;

    expect(await appkitUiElementColorsPlugin.getPlatformVersion(), '42');
  });
}
