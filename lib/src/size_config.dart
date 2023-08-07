import 'package:flutter/widgets.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 500.0;
  static double screenHeight = 500.0;
  static double blockSizeHorizontal = 20.0;
  static double blockSizeVertical = 20.0;
  static double bigTitleFontSize = 24.0;
  static double titleFontSize = 16.0;
  static double tapBarTextFontSize = 11.0;
  static double textFontSize = 14.0;
  static double smallTextFontSize = 13.0;
  static double iconSize = 18.0;
  static double smallIconSize = 15.0;
  static double smallestIconSize = 13.0;
  static double btnHeight = 40.0;
  static double appBarHeight = 55.0;
  static double padding = 8.0;
  static double btnRadius = 12.0;
  static double borderWidth = 1;

  ///Mobile
  final double _mobileBigTitleFontSize = 24.0;
  final double _mobileTitleFontSize = 16.0;
  final double _mobileTapBarTextFontSize = 11.0;
  final double _mobileTextFontSize = 14.0;
  final double _mobileSmallTextFontSize = 13.0;
  final double _mobileIconSize = 18.0;
  final double _mobileSmallIconSize = 15.0;
  final double _mobileSmallestIconSize = 13.0;
  final double _mobileBtnHeight = 40.0;
  final double _mobileAppBarHeight = 55.0;
  final double _mobilePadding = 8.0;
  final double _mobileBtnRadius = 12.0;
  final double _mobileBorderWidth = 1;

  ///Tablet
  final double _tabletBigTitleFontSize = 24.0;
  final double _tabletTitleFontSize = 16.0;
  final double _tabletTapBarTextFontSize = 11.0;
  final double _tabletTextFontSize = 14.0;
  final double _tabletSmallTextFontSize = 13.0;
  final double _tabletIconSize = 18.0;
  final double _tabletSmallIconSize = 15.0;
  final double _tabletSmallestIconSize = 13.0;
  final double _tabletBtnHeight = 40.0;
  final double _tabletAppBarHeight = 55.0;
  final double _tabletPadding = 8.0;
  final double _tabletBtnRadius = 12.0;
  final double _tabletBorderWidth = 1;

  ///DeskTop
  final double _deskTopBigTitleFontSize = 24.0;
  final double _deskTopTitleFontSize = 16.0;
  final double _deskTopTapBarTextFontSize = 11.0;
  final double _deskTopTextFontSize = 14.0;
  final double _deskTopSmallTextFontSize = 13.0;
  final double _deskTopIconSize = 18.0;
  final double _deskTopSmallIconSize = 15.0;
  final double _deskTopSmallestIconSize = 13.0;
  final double _deskTopBtnHeight = 40.0;
  final double _deskTopAppBarHeight = 55.0;
  final double _deskTopPadding = 8.0;
  final double _deskTopBtnRadius = 12.0;
  final double _deskTopBorderWidth = 1;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    if (screenWidth > 950) {
      bigTitleFontSize = _deskTopBigTitleFontSize;
      titleFontSize = _deskTopTitleFontSize;
      tapBarTextFontSize = _deskTopTapBarTextFontSize;
      textFontSize = _deskTopTextFontSize;
      smallTextFontSize = _deskTopSmallTextFontSize;
      iconSize = _deskTopIconSize;
      smallIconSize = _deskTopSmallIconSize;
      smallestIconSize = _deskTopSmallestIconSize;
      btnHeight = _deskTopBtnHeight;
      appBarHeight = _deskTopAppBarHeight;
      padding = _deskTopPadding;
      btnRadius = _deskTopBtnRadius;
      borderWidth = _deskTopBorderWidth;
    }

    if (screenWidth > 600) {
      bigTitleFontSize = _tabletBigTitleFontSize;
      titleFontSize = _tabletTitleFontSize;
      tapBarTextFontSize = _tabletTapBarTextFontSize;
      textFontSize = _tabletTextFontSize;
      smallTextFontSize = _tabletSmallTextFontSize;
      iconSize = _tabletIconSize;
      smallIconSize = _tabletSmallIconSize;
      smallestIconSize = _tabletSmallestIconSize;
      btnHeight = _tabletBtnHeight;
      appBarHeight = _tabletAppBarHeight;
      padding = _tabletPadding;
      btnRadius = _tabletBtnRadius;
      borderWidth = _tabletBorderWidth;
    }
    if (screenWidth < 600) {
      bigTitleFontSize = _mobileBigTitleFontSize;
      titleFontSize = _mobileTitleFontSize;
      tapBarTextFontSize = _mobileTapBarTextFontSize;
      textFontSize = _mobileTextFontSize;
      smallTextFontSize = _mobileSmallTextFontSize;
      iconSize = _mobileIconSize;
      smallIconSize = _mobileSmallIconSize;
      smallestIconSize = _mobileSmallestIconSize;
      btnHeight = _mobileBtnHeight;
      appBarHeight = _mobileAppBarHeight;
      padding = _mobilePadding;
      btnRadius = _mobileBtnRadius;
      borderWidth = _mobileBorderWidth;
    }
  }
}
