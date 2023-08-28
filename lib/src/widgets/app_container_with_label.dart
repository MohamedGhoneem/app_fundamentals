import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppContainerWithLabel extends StatelessWidget {
  final Color? borderColor;
  final Widget child;
  final Widget label;
  final Color? labelBackgroundColor;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const AppContainerWithLabel(
      {Key? key,
      this.borderColor,
      required this.label,
      required this.child,
      this.labelBackgroundColor,
      this.width,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: borderColor ?? Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 4),
          child: child,
        ),
        Positioned(
          top: -9,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                color: labelBackgroundColor ?? Colors.transparent,
                child: label),
          ),
        ),
      ],
    );
  }
}
