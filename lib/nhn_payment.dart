
import 'dart:async';

import 'package:flutter/services.dart';

class NhnPayment {
  static const MethodChannel _channel = MethodChannel('nhn_payment');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
