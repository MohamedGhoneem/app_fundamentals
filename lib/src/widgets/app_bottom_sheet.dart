import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppBottomSheet {
  final BuildContext context;
  final Widget widget;

  AppBottomSheet({required this.context, required this.widget}) {
    _modalBottomSheetMenu();
  }

  void _modalBottomSheetMenu() async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Wrap(
            children: [widget],
          );
        });
  }
}
