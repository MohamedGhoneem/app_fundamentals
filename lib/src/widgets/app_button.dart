import 'package:flutter/material.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
enum AppButtonAlign {
  start,
  center,
  centerStartIcon,
  centerEndIcon,
  end,
  none,
  expandedEndIcon,
  expandedStartIcon
}

class AppButton extends StatelessWidget {
  final String title;
  final double? titleFontSize;
  final Widget? icon;
  final TextStyle? style;
  final Color borderColor;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? spaceBetween;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final AppButtonAlign? alignment;
  final InteractiveInkFeatureFactory? splashFactory;
  final RoundedRectangleBorder? roundedRectangleBorder;

  const AppButton(
      {Key? key,
      required this.title,
      this.titleFontSize,
      this.icon,
      this.style,
      required this.borderColor,
      required this.backgroundColor,
      this.width,
      this.height,
      this.radius,
      this.spaceBetween,
      this.padding,
      this.margin,
      required this.onTap,
      this.alignment,
      this.splashFactory,
      this.roundedRectangleBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin ?? EdgeInsets.zero,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          primary: backgroundColor,
          splashFactory: splashFactory ?? InkRipple.splashFactory,
          shape: roundedRectangleBorder ??
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 0.0))),
          side: BorderSide(color: borderColor, width: 1),
        ),
        autofocus: false,
        onPressed: onTap,
        child: Padding(padding: padding ?? EdgeInsets.zero, child: btn()),
      ),
    );
  }

  Widget btn() {
    if (icon != null && title.isEmpty) {
      return icon!;
    } else if (alignment != null) {
      switch (alignment!) {
        case AppButtonAlign.start:
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              _title(),
            ],
          );
        case AppButtonAlign.center:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.centerStartIcon:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              _title(),
            ],
          );
        case AppButtonAlign.end:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.expandedStartIcon:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              Expanded(child: _title()),
            ],
          );
        case AppButtonAlign.expandedEndIcon:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _title()),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.none:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.centerEndIcon:
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: spaceBetween ?? 8),
              if (icon != null) icon!,
            ],
          );
      }
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _title(),
          if (icon != null) SizedBox(width: spaceBetween ?? 8),
          if (icon != null) icon!,
        ],
      );
    }
  }

  Widget _title() {
    return AppText(
      label: title,
      style: style ??
          TextStyle(
              fontSize: titleFontSize ?? 14,
              color: Colors.black,
              decoration: TextDecoration.none),
    );
  }
}
