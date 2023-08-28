import 'package:flutter/material.dart';
import 'dart:math' as math;

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppBackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String? backIconPath;
  final String? currentLanguage;
  final EdgeInsets? padding;

  const AppBackIcon(
      {Key? key,
      this.onTap,
      this.backIconPath,
      required this.currentLanguage,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: Transform(
          transform: Matrix4.rotationY(currentLanguage == 'en' ? 0 : math.pi),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
