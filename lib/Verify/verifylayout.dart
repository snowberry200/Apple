import 'package:apple/Verify/tabletverify.dart';
import 'package:flutter/material.dart';

import '../HomeLayOuts/layout.dart';
import 'desktopverify.dart';
import 'mobileverify.dart';

class VerifyLayoutPage extends StatefulWidget {
  final String verify;
  const VerifyLayoutPage({Key? key, required this.verify}) : super(key: key);

  @override
  State<VerifyLayoutPage> createState() => _VerifyLayoutPageState();
}

class _VerifyLayoutPageState extends State<VerifyLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= desktopScreenSize) {
          return DesktopLayout(confirmemail: widget.verify);
        } else if (constraints.maxWidth < desktopScreenSize &&
            constraints.maxWidth >= tabletScreenSize) {
          return const TabletLayout();
        } else {
          return MobileVerifyPage(confirmemail: widget.verify);
        }
      },
    );
  }
}
