import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';
import '../../shared_preferences_helper.dart';
import '../../shared_preferences_keys.dart';


///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
enum ThemeModes { light, dark }

class ThemeManagerBloc extends BaseBloc {
  ValueNotifier<ThemeModes> themeData =
      ValueNotifier<ThemeModes>(ThemeModes.light);

  ThemeManagerBloc() {
    getThemeMode();
  }

  getThemeMode() {
    if (SharedPreferenceHelper.getValueForKey(SharedPrefsKeys.themeMode) ==
        null) {
      SharedPreferenceHelper.setValueForKey(
          SharedPrefsKeys.themeMode, ThemeModes.light.name);
      themeData.value = ThemeModes.dark;
    } else if (SharedPreferenceHelper.getValueForKey(
            SharedPrefsKeys.themeMode) ==
        ThemeModes.light.name) {
      themeData.value = ThemeModes.dark;
    } else {
      themeData.value = ThemeModes.dark;
    }
    debugPrint('themeType.name : ${themeData.value}');

  }
  setThemeMode(ThemeModes themeMode){
    SharedPreferenceHelper.setValueForKey(
        SharedPrefsKeys.themeMode, themeMode.name);
    themeData.value = themeMode;
    debugPrint('setting theme ${themeMode.name}');
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }
}

ThemeManagerBloc themeManagerBloc = ThemeManagerBloc();
