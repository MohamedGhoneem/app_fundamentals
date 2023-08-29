import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_text.dart';
import 'nav_bar_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class NavBarWidget extends StatelessWidget {
  final double height;
  final double textFontSize;
  final Color background;
  final Color borderColor;
  final Color selectedColor;
  final Color unSelectedColor;

  const NavBarWidget(
      {Key? key,
      required this.height,
      required this.textFontSize,
      required this.background,
      required this.borderColor,
      required this.selectedColor,
      required this.unSelectedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + MediaQuery.of(context).viewPadding.bottom,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
      decoration: BoxDecoration(
          color: background,
          border: Border(top: BorderSide(color: borderColor, width: .7))),
      child: StreamBuilder<int>(
          stream: navBarBloc.indexStream,
          builder: (context, snapshot) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < navBarBloc.naveBarItemList.length; i++)
                  Expanded(
                      child: navBarItem(
                          index: i,
                          icon: navBarBloc.naveBarItemList[i].icon,
                          title: navBarBloc.naveBarItemList[i].title,
                          color: snapshot.data == i
                              ? selectedColor
                              : unSelectedColor)),
              ],
            );
          }),
    );
  }

  Widget navBarItem({
    required int index,
    required Widget? icon,
    required String? title,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        navBarBloc.pickItem(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null) icon,
          // AppImage(
          //   path: iconPath,
          //   height: iconHeight ?? 18,
          //   width: iconWidth ?? 18,
          //   color: color,
          // ),
          if (icon != null) const SizedBox(height: 4),
          AppText(
            label: title ?? '',
            style: TextStyle(fontSize: textFontSize, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
