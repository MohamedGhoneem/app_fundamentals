## Getting started

With `null-safety`

## Usage

If you are starting a new complex flutter app and need to build up your base widgets by the easiest way you will need to use app_fundamentals plugin.
this is the available widgets you can try.

![](../../../../Downloads/app_fundamentals.PNG.png)


Add the dependency to your project and start using **app_fundamentals** #
```dart 
dependencies:
   app_fundamentals : ^0.0.9
```


Importing the package #

```dart
import 'package:app_fundamentals/app_fundamentals.dart';
```



## Examples

lets take for example the usage of BaseStatefulWidget
if you extend BaseStatefulWidget to build your screen you can override multiple methods to easy create new screen in your app.

```dart
class MyPage extends BaseStatefulWidget {
  const OtpVerificationPageMobile({super.key});

  @override
  BaseState<MyPage> createState() =>
      _MyPageState();
}

class _MyPageState
    extends BaseState<OtpVerificationPageMobile> {
  ....
  @override
  void initState() {
  super.initState();
  ....
  }
  @override
  Widget setBody(BuildContext context) {
  return Container();
  }

  @override
  String? setScaffoldBackgroundImage() {
  return "";
  }

  @override
  Widget? setBottomNavigationBar() {
  return Container();
  }

  @override
  Future<bool> setOnWillPop() {
  return Future.value(true);
  }

  @override
  bool setResizeToAvoidBottomInset() {
  return false;
  }
}

```
as another example widget app_fundamental provide NavBarWidget and NavBarBloc to easy use NavBar in our app all you need to do is to use NavBarWidget in you StateFullWidget as BottomNavigationBar like this.

```dart
@override
Widget? setBottomNavigationBar() {
  return NavBarWidget(
      height: 64.0,
      textFontSize: 14.0,
      background: Colors.white,
      borderColor: Colors.black,
      selectedColor: Colors.blue,
      unSelectedColor: Colors.white,
      selectedFontWeight: FontWeight.w700,
      unSelectedFontWeight: FontWeight.w900,
      ....
  );
}
```

also you should identify your naveBarItemList by using navBarBloc like this.
```dart
navBarBloc.naveBarItemList = [
NavBarItem(
title:"Home",
widget: Container(),
selectedIcon: SvgPicture.asset(
selectedHomeSvg,
width: 24.0,
height: 24.0,
),
unSelectedIcon: SvgPicture.asset(
'assets/svg/home.svg',
width: 24.0,
height: 24.0,
),
onTap: () {
debugPrint('index 0');
},
),
NavBarItem(
.....
),
NavBarItem(
.....
),
];
```
```dart
AppButton
(
title: 'Back',
alignment: AppButtonAlign.start,
icon: SvgPicture.asset('assets/svg/backButtonIcon.svg'),
onTap: () => Navigator.pop(context)
);
```

```dart
AppText
(
label: 'Text',
textAlign: TextAlign.right,
style: TextStyle(
color: Colors.red,
fontSize: 14,
fontWeight: FontWeight.bold,
)
);
```
```dart
AppTextFormFieldItem
(
controller: TextEditingController(),
readOnly:
stateSnapshot.data?.status == RequestStatus.loading
? true
    : false,
autofocus: true,
title: AppLocalizations.of(context).email,
formFieldItemType: AppFormFieldItemType.email,
stream: _signInBloc.emailStream,
onChanged: _signInBloc.onChangedEmailField,
textInputType: TextInputType.emailAddress,
labelFontColor: Colors.black,
borderColor: Colors.grey,
focusedBorderColor: Colors.grey,
iconColor: Colors.black,
focusedIconColor: Colors.grey,
fillColor: Colors.white,
showHint: true,
validator: (val) => _signInBloc.validateEmail(val),
fontSize: 14.0,
contentPadding: EdgeInsets.symmetric(
horizontal: 8.0,
vertical: 8.0),
borderRadius: BorderRadius.all(
Radius.circular(8.0
)
)
);
```
```dart
AppBorderedDropDown(
            list: ["first", "second", "third"],
            selectedStateSubject: selectedStateSubject,
            selectedSubject: selectedSubject,
            borderColorSubject: borderColorSubject,
            onTap: (){},
            onChange: (val){},
            titleKey: "",
            label: "",
            hint: "",);
```
```dart
AppBottomSheet(context: context, widget: Container(),);
```
```dart
AppContainerWithLabel(label: Text("label"), child: widget,);
```
```dart
final AppDialog appDialog = AppDialog();
appDialog.child = AppDialogContent(title: "title",description: "description",);

...

Future<void> showAppDialog(AppDialog appDialog) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => appDialog);
}

Future<void>? hideAppDialog(AppDialog appDialog) {
  if (appDialog.isShowing()) {
    appDialog.pop();
    appDialog = AppDialog();
  }
  return null;
}
```
```dart
AppDivider(
          dividerPadding: EdgeInsets.symmetric(horizontal: 16.0),
          thickness: 2.0,
          dividerColor: Colors.grey,
        );
```
```dart
AppExpandedRadioButton(
          onTap: () {},
          label: "label",
          labelFontSize: 24.0,
          labelFontColor: Colors.black,
          isSelected: true,
        );
```
```dart
AppImage(
          path: "image_path",
          height: 40.0,
          width: 40.0,
          isCircular: true,
          boxFit: BoxFit.cover,
          color: Colors.white,
          onPressed: () {},
          defaultImage: AppImage(path: "default_image_path"),
          loadingWidget: LoadingWidget(),
        );
```
```dart
AppLabelWithIcon(
          label: "label",
          labelColor: Colors.black,
          icon: Icon(Icons.search),
        );
```
```dart
AppRefreshIndicator(
            child: Container(),
             onRefresh: () {},
             );
```
```dart
AppWebView(
        title: "title",
         url: "",
         );
```
```dart
final Encryptor encryptor = Encryptor();
      encryptor.encryptData("hello");
      encryptor.decryptData("efgdt-vvxvxxvxvxfgfg-bcbcbcbcbcbcbcbcbcbcb");
```

## Improve

Help me by reporting bugs, **submit new ideas** for features or anything else that you want to
share.

- Just [write an issue](https://github.com/MohamedGhoneem/app_fundamentals/issues) on GitHub. ✏️
- And don't forget to hit the **like button** for this package ✌️

## More

Check out my other useful packages on [pub.dev](https://pub.dev/publishers/ghoneem.com/packages)

