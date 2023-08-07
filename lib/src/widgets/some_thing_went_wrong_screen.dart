import 'package:flutter/material.dart';
import '../colors.dart';
import '../size_config.dart';
import 'app_button.dart';
import 'app_image.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class SomeThingWentWrongScreen extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextAlign? textAlign;
  final VoidCallback retry;

  const SomeThingWentWrongScreen(
      {Key? key,
      required this.label,
      this.style,
      this.textAlign,
      required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          path: 'someThingWentWrongPng',
          width: SizeConfig.blockSizeHorizontal * 60,
          height: SizeConfig.blockSizeHorizontal * 40,
        ),
        SizedBox(
          height: SizeConfig.padding,
        ),
        Text(
          'Error',
          style: style ??
              TextStyle(
                  fontSize: SizeConfig.titleFontSize,
                  color: AppColors.getFontColor()),
          textAlign: textAlign ?? TextAlign.start,
          maxLines: 1,
        ),
        SizedBox(
          height: SizeConfig.padding,
        ),
        Text(
          'Some Thing Went Wrong',
          style: style ??
              TextStyle(
                  fontSize: SizeConfig.titleFontSize,
                  color: AppColors.getLightFontColor()),
          textAlign: textAlign ?? TextAlign.center,
          maxLines: 2,
        ),
        SizedBox(
          height: SizeConfig.padding,
        ),
        AppButton(
          title: 'Refresh',
          borderColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          style: TextStyle(
              fontFamily: '',
              fontSize: SizeConfig.textFontSize,
              color: AppColors.whiteColor),
          alignment: AppButtonAlign.centerStartIcon,
          width: SizeConfig.blockSizeHorizontal * 25,
          radius: SizeConfig.blockSizeHorizontal * 2,
          onTap: retry,
        ),
      ],
    );
  }
}
