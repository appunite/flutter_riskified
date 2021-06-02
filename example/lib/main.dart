import 'package:flutter/material.dart';
import 'dart:async';

import 'package:riskified/riskified.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riskified example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  _startBeacon();
                },
                child: Text('startBeacon'),
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: token != null,
                child: Text(token ?? ""),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startBeacon() async {
    token = await Riskified.startBeacon('shop', 'token');

    setState(() {});
  }
}
