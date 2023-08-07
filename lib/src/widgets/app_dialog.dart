import 'package:flutter/material.dart';

// ignore: must_be_immutable
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppDialog extends StatefulWidget {
  bool shown = false;
  late BuildContext context;
  late Widget child;

  AppDialog({Key? key}) : super(key: key);

  bool isShowing() {
    return shown;
  }

  pop() {
    Navigator.of(context).pop();
  }

  @override
  createState() => AppDialogState();
}

class AppDialogState extends State<AppDialog> {
  @override
  void initState() {
    super.initState();
    widget.shown = true;
  }

  @override
  Widget build(BuildContext context) {
    widget.shown = true;
    widget.context = context;
    return widget.child;
  }

  @override
  void dispose() {
    widget.shown = false;
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.shown = false;
  }
}
