import 'package:flutter/material.dart';
import '../colors.dart';
import '../size_config.dart';
import 'app_button.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppDialogContent extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget? alertIcon;
  final String description;
  final TextStyle? descriptionStyle;
  final String? okButtonTitle;
  final String? cancelButtonTitle;
  final VoidCallback? okBtnTapped;
  final VoidCallback? cancelBtnTapped;

 const AppDialogContent(
      {Key? key,
      this.title,
        this.titleStyle,
      this.alertIcon,
      required this.description,
        this.descriptionStyle,
      this.okButtonTitle,
      this.cancelButtonTitle,
      this.okBtnTapped,
      this.cancelBtnTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.padding * 2,
                vertical: SizeConfig.padding * 5),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.btnRadius),
                color: AppColors.whiteColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      label: title ??'Alert',
                      style: titleStyle??TextStyle(
                          fontSize: SizeConfig.titleFontSize,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    alertIcon ?? const SizedBox()
                  ],
                ),
                SizedBox(height: SizeConfig.padding),
                AppText(
                  label: description,
                  style: descriptionStyle??TextStyle(
                      fontSize: SizeConfig.titleFontSize,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: SizeConfig.padding * 2),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppButton(
                          width: double.infinity,
                          height: SizeConfig.btnHeight - 5,
                          style: TextStyle(
                              fontSize: SizeConfig.titleFontSize,
                              color: AppColors.whiteColor),
                          title: okButtonTitle ??'Ok',
                          borderColor: AppColors.primaryColor,
                          backgroundColor: AppColors.primaryColor,
                          radius: SizeConfig.btnRadius/2,
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
                            height: SizeConfig.btnHeight - 5,
                            style: TextStyle(
                                fontSize: SizeConfig.titleFontSize,
                                color: AppColors.whiteColor),
                            title: cancelButtonTitle ?? '',
                            borderColor: AppColors.blueColor,
                            backgroundColor: AppColors.blueColor,
                            radius: SizeConfig.btnRadius/2,
                            onTap:
                                cancelBtnTapped ?? () => Navigator.pop(context),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: SizeConfig.padding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
