import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_text.dart';
import 'nav_bar_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class NavBarWidget extends StatelessWidget {
  final List<NavBarItem> naveBarItemList;
  final double height;
  final double? iconHeight;
  final double? iconWidth;
  final double textFontSize;
  final Color background;
  final Color borderColor;
  final Color selectedColor;
  final Color unSelectedColor;

  const NavBarWidget(
      {Key? key,
      required this.naveBarItemList,
      required this.height,
      this.iconHeight,
      this.iconWidth,
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
                for (int i = 0; i > naveBarItemList.length; i++)
                  Expanded(
                      child: navBarItem(
                          index: i,
                          iconPath: naveBarItemList[i].iconPath,
                          title: naveBarItemList[i].title,
                          color: snapshot.data == i
                              ? selectedColor
                              : unSelectedColor)),
              ],
            );
          }),
    );
  }

  Widget navBarItem(
      {required int index,
      required String? iconPath,
      String? title,
      required Color color,
      TextStyle? style}) {
    return InkWell(
      onTap: () {
        navBarBloc.pickItem(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (iconPath != null)
            AppImage(
              path: iconPath,
              height: iconHeight ?? 18,
              width: iconWidth ?? 18,
              color: color,
            ),
          if (iconPath != null)
            const SizedBox(
              height: 4,
            ),
          AppText(
            label: title ?? '',
            style: style ?? TextStyle(fontSize: textFontSize, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
