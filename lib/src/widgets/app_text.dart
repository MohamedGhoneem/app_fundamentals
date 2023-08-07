import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_config.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppText extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
      {Key? key,
      required this.label,
      this.style,
      this.textAlign,
      this.maxLines,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style ??
          TextStyle(
              fontSize: SizeConfig.textFontSize,
              color: AppColors.getFontColor(),
              decoration: TextDecoration.none),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
