import 'package:app_fundamentals/src/widgets/text_form_field/app_text_form_field_enum.dart';
import 'package:app_fundamentals/src/widgets/text_form_field/password_text_form_field_item.dart';
import 'package:app_fundamentals/src/widgets/text_form_field/text_form_field_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class AppTextFormFieldItem extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final AppFormFieldItemType formFieldItemType;
  final BehaviorSubject subject;
  final BehaviorSubject<bool>? obscureTextSubject;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final double? fontSize;
  final Color? fontColor;
  final Widget? label;
  final Widget? prefixIcon;
  final Color labelFontColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color? cursorColor;
  final Color iconColor;
  final Color focusedIconColor;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool? showHint;
  final bool? showUnderLine;
  final bool? readOnly;
  final bool? autofocus;
  final EdgeInsets? contentPadding;
  final VoidCallback? submit;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final Widget? showPasswordIcon;
  final BorderRadius? borderRadius;
  final Color? fillColor;

  const AppTextFormFieldItem({
    this.controller,
    required this.title,
    required this.formFieldItemType,
    required this.subject,
    this.obscureTextSubject,
    this.focusNode,
    required this.textInputType,
    this.fontSize,
    this.fontColor,
    this.label,
    this.prefixIcon,
    required this.labelFontColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.cursorColor,
    required this.iconColor,
    required this.focusedIconColor,
    this.maxLines,
    this.onTap,
    this.validator,
    this.showHint = false,
    this.showUnderLine = false,
    this.readOnly = false,
    this.autofocus = false,
    this.contentPadding,
    this.submit,
    this.onChanged,
    this.maxLength,
    this.showPasswordIcon,
    this.borderRadius,
    this.fillColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, snapshot) {
          return formFieldItemType == AppFormFieldItemType.password &&
                  obscureTextSubject != null
              ? StreamBuilder(
                  stream: obscureTextSubject!.stream,
                  builder: (context, obscureTextSnapshot) {
                    return PasswordTextFormFieldItem(
                        controller: controller,
                        title: title,
                        formFieldItemType: formFieldItemType,
                        subject: subject,
                        obscureTextSubject: obscureTextSubject,
                        focusNode: focusNode,
                        textInputType: textInputType,
                        fontSize: fontSize,
                        fontColor: fontColor,
                        label: label,
                        prefixIcon: prefixIcon,
                        labelFontColor: labelFontColor,
                        borderColor: borderColor,
                        focusedBorderColor: focusedBorderColor,
                        cursorColor: cursorColor,
                        iconColor: iconColor,
                        focusedIconColor: focusedIconColor,
                        maxLines: maxLines,
                        onTap: onTap,
                        validator: validator,
                        showHint: showHint,
                        showUnderLine: showUnderLine,
                        readOnly: readOnly,
                        autofocus: autofocus,
                        contentPadding: contentPadding,
                        submit: submit,
                        onChanged: onChanged,
                        maxLength: maxLength,
                        showPasswordIcon: showPasswordIcon,
                        borderRadius: borderRadius,
                        fillColor: fillColor,
                        obscureTextSnapshot:
                            obscureTextSnapshot.data == true ? true : false);
                  })
              : TextFormFieldItem(
                  controller: controller,
                  title: title,
                  formFieldItemType: formFieldItemType,
                  subject: subject,
                  obscureTextSubject: obscureTextSubject,
                  focusNode: focusNode,
                  textInputType: textInputType,
                  fontSize: fontSize,
                  fontColor: fontColor,
                  label: label,
                  prefixIcon: prefixIcon,
                  labelFontColor: labelFontColor,
                  borderColor: borderColor,
                  focusedBorderColor: focusedBorderColor,
                  cursorColor: cursorColor,
                  iconColor: iconColor,
                  focusedIconColor: focusedIconColor,
                  maxLines: maxLines,
                  onTap: onTap,
                  validator: validator,
                  showHint: showHint,
                  showUnderLine: showUnderLine,
                  readOnly: readOnly,
                  autofocus: autofocus,
                  contentPadding: contentPadding,
                  submit: submit,
                  onChanged: onChanged,
                  maxLength: maxLength,
                  showPasswordIcon: showPasswordIcon,
                  borderRadius: borderRadius,
                  fillColor: fillColor,
                );
        });
  }
}
