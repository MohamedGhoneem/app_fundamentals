import 'package:flutter/material.dart';
import 'app_button.dart';

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
  final TextStyle? retryTitleStyle;
  final Color? retryButtonBorderColor;
  final Color? retryButtonBackgroundColor;
  final VoidCallback retry;

  const SomeThingWentWrongScreen({
    Key? key,
    required this.image,
    required this.labelString,
    required this.errorString,
    this.labelStyle,
    this.errorStyle,
    this.retryTitle,
    required this.retry,
    this.retryTitleStyle,
    this.retryButtonBorderColor,
    this.retryButtonBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        const SizedBox(height: 16),
        Text(
          labelString,
          style:
              labelStyle ?? const TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        const SizedBox(height: 16),
        Text(
          errorString,
          style:
              errorStyle ?? const TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        AppButton(
          title: retryTitle ?? 'Refresh',
          borderColor: retryButtonBorderColor ?? Colors.blue,
          backgroundColor: retryButtonBackgroundColor ?? Colors.blue,
          style: retryTitleStyle ??
              const TextStyle(
                  fontFamily: '', fontSize: 13, color: Colors.white),
          alignment: AppButtonAlign.centerStartIcon,
          width: MediaQuery.of(context).size.width * 25,
          radius: 4,
          onTap: retry,
        ),
      ],
    );
  }
}
