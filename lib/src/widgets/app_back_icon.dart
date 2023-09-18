import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../app_fundamentals.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppBackIcon extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? radius;
  final VoidCallback? onTap;
  final Widget? icon;
  final String? currentLanguage;

  const AppBackIcon({
    Key? key,
    this.title,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.radius,
    this.onTap,
    this.icon,
    required this.currentLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: '',
      backgroundColor: backgroundColor ?? Colors.transparent,
      borderColor: borderColor ?? Colors.transparent,
      width: width,
      height: height,
      radius: radius,
      onTap: onTap,
      icon: Transform(
          transform: Matrix4.rotationY(currentLanguage == 'en' ? 0 : math.pi),
          child: icon ?? const Icon(Icons.arrow_back_ios)),
    );
  }
}
