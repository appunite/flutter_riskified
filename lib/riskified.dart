import 'dart:async';

import 'package:flutter/services.dart';

class Riskified {
  static const MethodChannel _channel = const MethodChannel('riskified');

  static Future<String> startBeacon(String shop, String token) {
    return _channel.invokeMethod('startBeacon', {'shop': shop, 'token': token});
  }
}
