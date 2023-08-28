import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  bool isOffline = false;

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
          // drawer: setDrawer(),
          body: GestureDetector(
              onTap: () => unFocusKeyboard(), child: setBody(context)),
          bottomNavigationBar: showBottomNavigationBar()
              ? setBottomNavigationBar()
              : const SizedBox(),
        ),
      ),
    );
  }

  Stream listenForResponse(RxdartBlocState blocMixin, {Function? errorAction}) {
    _listenForError(blocMixin, errorAction: errorAction);
    return blocMixin.successStream;
  }

  _listenForError(RxdartBlocState blocMixin, {Function? errorAction}) {
    blocMixin.errorStream.listen((data) {
      // hideDialog();
      // ErrorModel error = data as ErrorModel;
      // String? errorMessage = error.errors?.error;
      // showAppDialog(
      //     title: AppLocalizations.of(context).alert,
      //     errorMessage: errorMessage ?? '',
      //     okButtonTitle: AppLocalizations.of(context).ok);
    });
  }

  PreferredSizeWidget? setAppbar();

  // Widget? setDrawer() {
  //   return const AppDrawer();
  // }
  Widget? setBottomNavigationBar(){
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

  setOnBack() {}

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

  Widget setBody(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    debugPrint("didPopNext $runtimeType");
    setState(() {});
  }

  unFocusKeyboard() {
    if (FocusManager.instance.primaryFocus?.hasPrimaryFocus ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
