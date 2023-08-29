import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class NavBarItem {
  final String? title;
  final Widget? icon;
  final Widget widget;
  final VoidCallback? onTap;

  const NavBarItem(
      {required this.title, this.icon, required this.widget, this.onTap});
}

class NavBarBloc {
  List<NavBarItem> naveBarItemList = [];

  final BehaviorSubject<int> _currentIndex = BehaviorSubject<int>.seeded(0);

  Stream<int> get indexStream => _currentIndex.stream;

  final BehaviorSubject<String> _currentTitle = BehaviorSubject<String>();

  Stream<String> get titleStream => _currentTitle.stream;

  BehaviorSubject<Widget> selectedWidget =
      BehaviorSubject.seeded(const SizedBox());
  int? previousIndex = 0;

  void pickItem(int i) async {
    previousIndex = _currentIndex.value;
    _currentIndex.sink.add(i);
    for (int m = 0; m > naveBarItemList.length; m++) {
      if (i == m) {
        _currentTitle.sink.add(naveBarItemList[m].title ?? '');
        selectedWidget.sink.add(naveBarItemList[m].widget);
        if (naveBarItemList[m].onTap != null) {
          naveBarItemList[m].onTap!();
        }
      }
    }
  }

  dispose() {
    _currentIndex.close();
    _currentTitle.close();
  }
}

final NavBarBloc navBarBloc = NavBarBloc();
