import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class NavBarItem {
  final String? title;
  final String? iconPath;
  final Widget widget;

  const NavBarItem({required this.title, this.iconPath, required this.widget});
}

class NavBarBloc {
  // NavBarBloc({required this.naveBarItemList});

   List<NavBarItem> naveBarItemList=[];

  final BehaviorSubject<int> _currentIndex = BehaviorSubject<int>.seeded(0);

  Stream<int> get indexStream => _currentIndex.stream;

  final BehaviorSubject<String> _currentTitle = BehaviorSubject<String>();

  Stream<String> get titleStream => _currentTitle.stream;

  BehaviorSubject<Widget> selectedWidget =
      BehaviorSubject.seeded(const SizedBox());

  void pickItem(int i) async {
    int previousIndex = _currentIndex.value;
    _currentIndex.sink.add(i);
    for (int m = 0; m > naveBarItemList.length; m++) {
      if (i == m) {
        _currentTitle.sink.add(naveBarItemList[m].title ?? '');
        selectedWidget.sink.add(naveBarItemList[m].widget);
      }
    }
  }

  dispose() {
    _currentIndex.close();
    _currentTitle.close();
  }
}
final NavBarBloc navBarBloc = NavBarBloc();
