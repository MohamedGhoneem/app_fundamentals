import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppDivider extends StatelessWidget {
  final EdgeInsets? dividerPadding;
  final double? thickness;
  final double? dividerHeight;
  final Color? dividerColor;

  const AppDivider({Key? key,this.dividerPadding, this.thickness, this.dividerHeight, this.dividerColor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return divider();
  }

  Widget divider() {
    return Padding(
      padding: dividerPadding ??
          const EdgeInsets.only(top: 16, bottom: 16),
      child: Divider(
        height: dividerHeight ?? 1,
        thickness: thickness??1,
        color: dividerColor ?? Colors.grey.withOpacity(.3),
      ),
    );
  }
}
