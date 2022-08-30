import 'package:apple/Verify/tabletverify.dart';
import 'package:flutter/material.dart';

import '../HomeLayOuts/layout.dart';
import 'desktopverify.dart';
import 'mobileverify.dart';

class VerifyLayoutPage extends StatefulWidget {
  final String appleEmail;
 final  dynamic applePassword;
  const VerifyLayoutPage({Key? key, required this.appleEmail, required this.applePassword}) : super(key: key);

  @override
  State<VerifyLayoutPage> createState() => _VerifyLayoutPageState();
}

class _VerifyLayoutPageState extends State<VerifyLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= desktopScreenSize) {
          return DesktopLayout( password: widget.applePassword,
            username: widget.appleEmail);
        } else if (constraints.maxWidth < desktopScreenSize &&
            constraints.maxWidth >= tabletScreenSize) {
          return  TabletLayout(
            password: widget.applePassword,
            username: widget.appleEmail
          );
        } else {
          return MobileVerifyPage( 
            password: widget.applePassword,
            username: widget.appleEmail);
        }
      },
    );
  }
}
