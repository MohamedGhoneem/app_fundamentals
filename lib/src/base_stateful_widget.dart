import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_core.dart';
import 'nav_bar/nav_bar_widget.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with RouteAware {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return WillPopScope(
      onWillPop: setOnWillPop,
      child: Container(
        decoration: setScaffoldBackgroundImage() != null
            ? BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(setScaffoldBackgroundImage() ?? '')))
            : const BoxDecoration(),
        child: Scaffold(
          floatingActionButton: setFloatingActionButton(),
          floatingActionButtonLocation: setFloatingActionButtonLocation(),
          resizeToAvoidBottomInset: setResizeToAvoidBottomInset(),
          backgroundColor: setScaffoldBackgroundColor(),
          key: getScreenKey,
          appBar: setAppbar(),
          drawer: setDrawer(),
          body: GestureDetector(
              onTap: () => unFocusKeyboard(), child: setBody(context)),
          bottomNavigationBar: showBottomNavigationBar()
              ? setBottomNavigationBar()
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget setBody(BuildContext context);

  Stream listenForResponse(RxdartBlocState blocMixin, {Function? errorAction}) {
    _listenForError(blocMixin, errorAction: errorAction);
    return blocMixin.successStream;
  }

  _listenForError(RxdartBlocState blocMixin, {Function? errorAction}) {
    blocMixin.errorStream.listen((data) async {
      Map error = data.toJson();
      AppDialog appDialog = AppDialog();
      appDialog.child = AppDialogContent(description: error['message'] ?? '');
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => appDialog);
    });
  }

  PreferredSizeWidget? setAppbar() {
    return null;
  }

  Widget? setDrawer() {
    return null;
  }

  Widget? setBottomNavigationBar() {
    return null;
  }

  bool showBottomNavigationBar() {
    return true;
  }

  String setTitle() {
    return '';
  }

  Widget? setFloatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? setFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  bool setResizeToAvoidBottomInset() {
    return true;
  }

  String? setScaffoldBackgroundImage() {
    return null;
  }

  Color setScaffoldBackgroundColor() {
    return Colors.white;
  }

  setOnBack() => setOnWillPop();

  Future<bool> setOnWillPop() {
    Navigator.pop(context);
    return Future.value(false);
  }

  List<Widget>? setBuildBarPopup() {
    return null;
  }

  get getScreenKey {
    return _scaffoldKey;
  }

  unFocusKeyboard() {
    if (FocusManager.instance.primaryFocus?.hasPrimaryFocus ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPush() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPush route: $route');
  }

  @override
  void didPopNext() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPopNext route: $route');
  }

  @override
  void didPushNext() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPushNext route: $route');
  }

  @override
  void didPop() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPop route: $route');
  }
}
