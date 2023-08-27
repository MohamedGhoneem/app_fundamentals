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
  final Widget image;
  final String labelString;
  final String errorString;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final String? retryTitle;
  final VoidCallback retry;

  const SomeThingWentWrongScreen(
      {Key? key,
      required this.image,
      required this.labelString,
      required this.errorString,
      this.labelStyle,
      this.errorStyle,
      this.retryTitle,
      required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        SizedBox(
          height: SizeConfig.padding,
        ),
        Text(
          labelString,
          style: labelStyle ??
              TextStyle(
                  fontSize: SizeConfig.titleFontSize,
                  color: AppColors.getFontColor()),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        SizedBox(
          height: SizeConfig.padding,
        ),
        Text(
         errorString,
          style: errorStyle ??
              TextStyle(
                  fontSize: SizeConfig.titleFontSize,
                  color: AppColors.getLightFontColor()),
          textAlign:TextAlign.center,
          maxLines: 2,
        ),
        SizedBox(
          height: SizeConfig.padding,
        ),
        AppButton(
          title: retryTitle??'Refresh',
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
