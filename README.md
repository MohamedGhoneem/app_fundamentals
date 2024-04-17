## Getting started

With `null-safety`

```dart 
        dependencies:app_fundamentals: ^0.0.8

```

Add the dependency to your project and start using **flavorizer_config** #

Importing the package #

```dart
import 'package:app_fundamentals/app_fundamentals.dart';
```

## Usage

To use this plugin, add flavorizer_config as a dependency in your pubspec.yaml file.

## Example

Here are an example that show you how to use this plugin.

## main.dart

```dart
AppButton
(
title: 'Back',
alignment: AppButtonAlign.start,
icon: SvgPicture.asset(backButtonIcon),
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
controller: _signInBloc.emailTextEditingController,
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
labelFontColor: labelColor,
borderColor: borderColor,
focusedBorderColor: textFormFieldFocusedColor,
iconColor: hintColor,
focusedIconColor: textFormFieldFocusedColor,
fillColor: bgColor,
showHint: true,
validator: (val) => _signInBloc.validateEmail(val),
fontSize: SizeConfig.subTitleFontSize,
contentPadding: EdgeInsets.symmetric(
horizontal: SizeConfig.padding,
vertical: SizeConfig.padding + 2.5),
borderRadius: BorderRadius.all(
Radius.circular(SizeConfig.paddingHalf
)
)
);
```

## Improve

Help me by reporting bugs, **submit new ideas** for features or anything else that you want to
share.

- Just [write an issue](https://github.com/MohamedGhoneem/app_fundamentals/issues) on GitHub. ✏️
- And don't forget to hit the **like button** for this package ✌️

## More

Check out my other useful packages on [pub.dev](https://pub.dev/publishers/ghoneem.com/packages)

