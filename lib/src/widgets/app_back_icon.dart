import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../shared_preferences_helper.dart';
import '../shared_preferences_keys.dart';
import '../size_config.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppBackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String? backIconPath;

  const AppBackIcon({Key? key, this.onTap, this.backIconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.padding),
        child: Transform(
          transform: Matrix4.rotationY(getLanguage() == 'en' ? 0 : math.pi),
          child:const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  static String getLanguage() {
    return SharedPreferenceHelper.getValueForKey(SharedPrefsKeys.languageKey) ??
        'en';
  }
}
