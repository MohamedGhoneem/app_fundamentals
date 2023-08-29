import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    MaterialInkController? controller,
    RenderBox? referenceBox,
    Offset? position,
    Color? color,
    TextDirection? textDirection,
    bool containedInkWell = false,
    Rect Function()? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NoSplash(
      color: color,
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    Color? color,
    @required MaterialInkController? controller,
    @required RenderBox? referenceBox,
  })  : assert(color != null),
        assert(controller != null),
        assert(referenceBox != null),
        super(
          color: color!,
          controller: controller!,
          referenceBox: referenceBox!,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
