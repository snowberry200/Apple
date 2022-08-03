import 'package:apple/screens/desktop.dart';
import 'package:apple/screens/mobile.dart';
import 'package:apple/screens/tablet.dart';
import 'package:flutter/material.dart';

const desktopScreenSize = 1290;
const tabletScreenSize = 800;
const mobileScreenSize = 300;

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= desktopScreenSize) {
          return const DesktopScreen();
        } else if (constraints.maxWidth < desktopScreenSize &&
            constraints.maxWidth >= tabletScreenSize) {
          return const TabletScreen();
        } else {
          return const MobileScreen();
        }
      },
    );
  }
}
