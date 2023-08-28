import 'package:flutter/material.dart';
import 'app_button.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppDialogContent extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? alertIcon;
  final String description;
  final TextStyle? descriptionStyle;
  final String? okButtonTitle;
  final TextStyle? okTitleStyle;
  final Color? okButtonBorderColor;
  final Color? okButtonBackgroundColor;
  final double? okButtonRadius;
  final double? okButtonHeight;
  final String? cancelButtonTitle;
  final TextStyle? cancelTitleStyle;
  final VoidCallback? okBtnTapped;
  final VoidCallback? cancelBtnTapped;
  final Color? cancelButtonBorderColor;
  final Color? cancelButtonBackgroundColor;
  final double? cancelButtonRadius;
  final double? cancelButtonHeight;

  const AppDialogContent(
      {Key? key,
      this.backgroundColor,
      this.title,
      this.titleStyle,
      this.alertIcon,
      required this.description,
      this.descriptionStyle,
      this.okButtonTitle,
      this.okTitleStyle,
      this.okButtonBorderColor,
      this.okButtonBackgroundColor,
      this.okButtonRadius,
      this.okButtonHeight,
      this.cancelButtonTitle,
      this.cancelTitleStyle,
      this.okBtnTapped,
      this.cancelBtnTapped,
      this.cancelButtonBorderColor,
      this.cancelButtonBackgroundColor,
      this.cancelButtonRadius,
      this.cancelButtonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor ?? Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      label: title ?? 'Alert',
                      style: titleStyle ??
                          const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                    ),
                    alertIcon ?? const SizedBox()
                  ],
                ),
                const SizedBox(height: 16),
                AppText(
                  label: description,
                  style: descriptionStyle ??
                      const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppButton(
                          width: double.infinity,
                          height: okButtonHeight ?? 40,
                          style: okTitleStyle ??
                              const TextStyle(
                                  fontSize: 16, color: Colors.white),
                          title: okButtonTitle ?? 'Ok',
                          borderColor: okButtonBorderColor ?? Colors.blue,
                          backgroundColor:
                              okButtonBackgroundColor ?? Colors.blue,
                          radius: okButtonRadius ?? 4,
                          onTap: okBtnTapped ?? () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    if (cancelBtnTapped != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AppButton(
                            width: double.infinity,
                            height: cancelButtonHeight ?? 40,
                            style: cancelTitleStyle ??
                                const TextStyle(
                                    fontSize: 16, color: Colors.white),
                            title: cancelButtonTitle ?? '',
                            borderColor: cancelButtonBorderColor ?? Colors.grey,
                            backgroundColor:
                                cancelButtonBackgroundColor ?? Colors.grey,
                            radius: cancelButtonRadius ?? 4,
                            onTap:
                                cancelBtnTapped ?? () => Navigator.pop(context),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
