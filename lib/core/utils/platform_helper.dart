import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

bool get shouldShow3DModel {
  if (kIsWeb) return true;
  try {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return false;
    }
    return Platform.isAndroid || Platform.isIOS;
  } catch (_) {
    return false;
  }
}
