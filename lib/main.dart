import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'src/ui/facebook_ui.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => const MainApp(),
    enabled: !kReleaseMode,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: const FacebookUi(),
      theme: ThemeData(fontFamily: 'Nunito'),
    );
  }
}
