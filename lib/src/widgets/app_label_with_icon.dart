import 'package:flutter/material.dart';
import '../size_config.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppLabelWithIcon extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Widget icon;
  final double? fontSize;

  const AppLabelWithIcon(
      {Key? key,
      required this.label,
      required this.labelColor,
      required this.icon,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          label: label,
          style: TextStyle(
              fontSize:
              fontSize ?? SizeConfig.textFontSize,color: labelColor),
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal/2),
        icon,
      ],
    );
  }
}
