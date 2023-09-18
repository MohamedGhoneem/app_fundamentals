import 'package:flutter/material.dart';
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
  final FontWeight? selectedFontWeight;
  final FontWeight? unSelectedFontWeight;
  final BoxDecoration? selectedDecoration;
  final BoxDecoration? unSelectedDecoration;

  const NavBarWidget({
    Key? key,
    required this.height,
    required this.textFontSize,
    required this.background,
    required this.borderColor,
    required this.selectedColor,
    required this.unSelectedColor,
    this.selectedFontWeight,
    this.unSelectedFontWeight,
    this.selectedDecoration,
    this.unSelectedDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + MediaQuery
          .of(context)
          .viewPadding
          .bottom,
      padding:
      EdgeInsets.only(bottom: MediaQuery
          .of(context)
          .viewPadding
          .bottom),
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
                        icon: snapshot.data == i
                            ? navBarBloc.naveBarItemList[i].selectedIcon
                            : navBarBloc.naveBarItemList[i].unSelectedIcon,
                        title: navBarBloc.naveBarItemList[i].title,
                        color: snapshot.data == i
                            ? selectedColor
                            : unSelectedColor,
                        fontWeight: snapshot.data == i
                            ? selectedFontWeight ?? FontWeight.bold
                            : unSelectedFontWeight ?? FontWeight.normal,
                        decoration: snapshot.data == i
                            ? selectedDecoration ?? const BoxDecoration()
                            : unSelectedDecoration ?? const BoxDecoration(),
                        topColor: snapshot.data == i
                            ? selectedColor : Colors.transparent),
                  ),
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
    required FontWeight fontWeight,
    required BoxDecoration decoration,
    required Color topColor,
  }) {
    return InkWell(
        onTap: () {
          navBarBloc.pickItem(index);
        },
        child: Container(
          decoration: decoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 2,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: topColor,
              ),
              const SizedBox(height: 4),
              if (icon != null) Flexible(child: icon),
              if (icon != null) const SizedBox(height: 4),
              AppText(
                label: title ?? '',
                style: TextStyle(
                    fontSize: textFontSize,
                    color: color,
                    fontWeight: fontWeight),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // Spacer()
            ],
          ),
        ));
  }
}
