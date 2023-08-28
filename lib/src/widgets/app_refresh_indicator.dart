import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;

  const AppRefreshIndicator(
      {Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
