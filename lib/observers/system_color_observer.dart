import 'dart:async';

import 'package:flutter/services.dart';

/// A class that observes changes to the system colors.
///
/// The class sends a null value through its [stream] whenever a
/// `NSColor.systemColorsDidChangeNotification` is received on the Swift side.
class SystemColorObserver {
  /// This [SystemColorObserver]’s method channel.
  final _channel =
      const MethodChannel('appkit_ui_element_colors/system_colors_did_change');

  /// The [StreamController] for the [stream].
  final _streamController = StreamController<void>.broadcast();

  /// A [Stream] that can used to listen for system color changes.
  Stream<void> get stream => _streamController.stream;

  /// Creates a [SystemColorObserver].
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
