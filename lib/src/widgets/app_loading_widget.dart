import 'package:flutter/material.dart';

import '../colors.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.primaryColor)),
    );
    // return Align(
    //   alignment: Alignment.center,
    //     child: AppImage(
    //   path: AppAssets.whiteLogo,
    //   width: SizeConfig.iconSize * 3,
    //   height: SizeConfig.iconSize * 3,
    // ));
  }
}
