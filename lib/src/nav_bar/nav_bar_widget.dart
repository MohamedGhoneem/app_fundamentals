import 'package:flutter/material.dart';
import '../blocs/theme/theme_manager_bloc.dart';
import '../colors.dart';
import '../size_config.dart';
import '../widgets/app_image.dart';
import '../widgets/app_text.dart';
import 'nav_bar_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class NavBarWidget extends StatelessWidget {
  final List<NavBarItem> naveBarItemList;

  const NavBarWidget({Key? key, required this.naveBarItemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeManagerBloc.themeData,
        builder: (context, themeType, child) {
          return Container(
            height: SizeConfig.appBarHeight +
                MediaQuery.of(context).viewPadding.bottom,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom),
            decoration: BoxDecoration(
                color: AppColors.getProfileItemBGColor(),
                border: const Border(
                    top: BorderSide(color: AppColors.borderColor, width: .7))),
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
                                iconPath: 'dashboardPng',
                                title: naveBarItemList[i].title,
                                color: snapshot.data == i
                                    ? AppColors.primaryColor
                                    : AppColors.greyColor)),
                    ],
                  );
                }),
          );
        });
  }

  Widget navBarItem(
      {required int index,
      required String iconPath,
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
          AppImage(
            path: iconPath,
            height: SizeConfig.iconSize,
            width: SizeConfig.iconSize,
            color: color,
          ),
          const SizedBox(
            height: 4,
          ),
          AppText(
            label: title ?? '',
            style: style ??
                TextStyle(
                    fontSize: SizeConfig.tapBarTextFontSize, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
