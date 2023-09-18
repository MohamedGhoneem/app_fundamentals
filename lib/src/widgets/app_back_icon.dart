import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../app_fundamentals.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppBackButton extends StatelessWidget {

  final VoidCallback? onTap;
  final Widget? icon;
  final String? currentLanguage;

  const AppBackButton({
    Key? key,
    this.onTap,
    this.icon,
    required this.currentLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(child: Transform(
          transform: Matrix4.rotationY(currentLanguage == 'en' ? 0 : math.pi),
          child: icon ?? const Icon(Icons.arrow_back_ios))),
    );
  }
}
