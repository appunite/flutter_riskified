import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riskified/riskified.dart';

void main() {
  const MethodChannel channel = MethodChannel('riskified');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'startBeacon') {
        return methodCall.arguments['token'];
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('startBeacon', () async {
    expect(await Riskified.startBeacon('shop', 'token'), 'token');
  });
}
