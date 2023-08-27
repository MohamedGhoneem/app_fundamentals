import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import 'app_loading_widget.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppImage extends StatelessWidget {
  final VoidCallback? onPressed;
  final String path;
  final double? height;
  final double? width;
  final bool? isCircular;
  final BoxFit? boxFit;
  final Color? color;

  const AppImage({
    required this.path,
    this.height,
    this.width,
    this.isCircular = false,
    this.boxFit = BoxFit.contain,
    this.color,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCircular! ? ClipOval(child: image()) : image();
  }

  Widget image() {
    if (path.startsWith('assets')) {
      if(path.endsWith('.svg')){
        return assetSvg();
      }
      return assetImage();
    } else {
      if(path.endsWith('.svg')){
        return assetSvg();
      }
      return netWorkImage();
    }
  }

  Widget netWorkImage() {
    return Image.network(
      path,
      scale: 1.1,
      fit: boxFit ?? BoxFit.contain,
      width: width,
      height: height,
      color: color,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return const Icon(
          Icons.error,
          color: AppColors.primaryColor,
        );
      },
      loadingBuilder: (BuildContext? context, Widget? child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child!;
        return const AppLoadingWidget();
      },
    );
  }

  // Widget netWorkSvg() {
  //   return SvgPicture.network(
  //     path,
  //     fit: boxFit ?? BoxFit.contain,
  //     width: width,
  //     height: height,
  //     color: color,
  //   );
  // }


  Widget assetImage() {
    return Image.asset(
      path,
      scale: 1.1,
      fit: boxFit ?? BoxFit.contain,
      width: width,
      height: height,
      color: color,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return Image.asset(
          'logoPng',
        );
      },
    );
  }

  Widget assetSvg() {
    return Image.asset(
      path,
      scale: 1.1,
      fit: boxFit ?? BoxFit.contain,
      width: width,
      height: height,
      color: color,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return Image.asset(
          'logoPng',
        );
      },
    );
  }
}
