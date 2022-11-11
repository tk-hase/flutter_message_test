import 'package:flutter/material.dart';
import 'package:flutter_message_test/router.dart';

void main() {
  runApp(const FlutterMessageTestApp());
}

class FlutterMessageTestApp extends StatelessWidget {
  const FlutterMessageTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
