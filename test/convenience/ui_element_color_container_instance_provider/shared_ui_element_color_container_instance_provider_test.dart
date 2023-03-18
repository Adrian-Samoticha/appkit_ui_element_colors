import 'dart:ui';

import 'package:appkit_ui_element_colors/appkit_ui_element_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'shared ui element color container instance provider media query conflict '
    'test 1',
    (tester) async {
      const mediaQueryData = MediaQueryData();
      const provider = SharedUiElementColorContainerInstanceProvider();

      for (int i = 0; i < 32; i += 1) {
        provider.registerMediaQueryData(mediaQueryData);
      }
    },
  );

  testWidgets(
    'shared ui element color container instance provider media query conflict '
    'test 2',
    (tester) async {
      const mediaQueryData = MediaQueryData();
      const provider = SharedUiElementColorContainerInstanceProvider();

      final registrationList = List.generate(
        64,
        (index) => provider.registerMediaQueryData(mediaQueryData),
      );

      for (final registration in registrationList) {
        provider.deregisterMediaQueryData(registration);
      }
    },
  );

  testWidgets(
    'shared ui element color container instance provider media query conflict '
    'test 3',
    (tester) async {
      const mediaQueryData1 = MediaQueryData(
        platformBrightness: Brightness.dark,
      );
      const mediaQueryData2 = MediaQueryData(
        platformBrightness: Brightness.light,
      );
      const provider = SharedUiElementColorContainerInstanceProvider();

      provider.registerMediaQueryData(mediaQueryData1);
      expect(
        () => provider.registerMediaQueryData(mediaQueryData2),
        throwsAssertionError,
      );
    },
  );

  testWidgets(
    'shared ui element color container instance provider media query conflict '
    'test 4',
    (tester) async {
      const mediaQueryData1 = MediaQueryData(
        platformBrightness: Brightness.dark,
      );
      const mediaQueryData2 = MediaQueryData(
        platformBrightness: Brightness.light,
      );
      const provider = SharedUiElementColorContainerInstanceProvider();

      final registration = provider.registerMediaQueryData(mediaQueryData1);
      provider.deregisterMediaQueryData(registration);
      provider.registerMediaQueryData(mediaQueryData2);
    },
  );
}
