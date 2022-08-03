import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'HomeLayOuts/layout.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
          theme: ThemeData(primaryColor: CupertinoColors.white),
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          home: const Homepage())));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Layout());
  }
}
