import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppLoadingWidget extends StatelessWidget {
  final Color? color;
  final Widget? loadingWidget;

  const AppLoadingWidget({Key? key, this.color, this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadingWidget ??
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(color ?? Colors.blue)),
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
