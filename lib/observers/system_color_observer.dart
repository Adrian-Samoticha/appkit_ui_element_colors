import 'dart:async';

import 'package:flutter/services.dart';

/// TODO: document this
class SystemColorObserver {
  final _channel =
      const MethodChannel('appkit_ui_element_colors/system_colors_did_change');
  final _streamController = StreamController<void>.broadcast();

  Stream<void> get stream => _streamController.stream;

  SystemColorObserver() {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "systemColorsDidChange":
          _streamController.add(null);
          return null;
      }

      return null;
    });
  }
}
