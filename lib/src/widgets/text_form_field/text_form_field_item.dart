import 'package:flutter/material.dart';

import 'app_text_form_field_enum.dart';
import 'base_text_form_field_item.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class TextFormFieldItem extends BaseTextFormFieldItem {
  const TextFormFieldItem({
    super.controller,
    required super.title,
    required super.formFieldItemType,
    super.obscureTextSubject,
    super.focusNode,
    required super.textInputType,
    super.textInputAction,
    super.fontSize,
    super.fontColor,
    super.label,
    super.prefixIcon,
    super.suffixIcon,
    required super.labelFontColor,
    required super.borderColor,
    required super.focusedBorderColor,
    super.cursorColor,
    required super.iconColor,
    required super.focusedIconColor,
    super.maxLines,
    super.onTap,
    super.validator,
    super.showHint = false,
    super.showUnderLine = false,
    super.readOnly = false,
    super.autofocus = false,
    super.contentPadding,
    super.submit,
    super.onChanged,
    super.maxLength,
    super.showPasswordIcon,
    super.borderRadius,
    super.fillColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      cursorColor: cursorColor,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      readOnly: readOnly ?? false,
      maxLines:
      formFieldItemType == AppFormFieldItemType.multiText ? maxLines : 1,
      maxLength: maxLength,
      style: TextStyle(
          fontSize: fontSize ?? 13, color: fontColor ?? Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: formFieldItemType == AppFormFieldItemType.password &&
          obscureTextSubject!.value
          ? true
          : false,
      keyboardType: textInputType,
      textInputAction: textInputAction??TextInputAction.done,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon,
        focusedBorder: showUnderLine == true
            ? UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: labelFontColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: focusedBorderColor),
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(4))),
        enabledBorder: showUnderLine == true
            ? UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: labelFontColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor),
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(4))),
        border: showUnderLine == true
            ? UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: labelFontColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor),
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(4))),
        errorBorder: showUnderLine == true
            ? const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red))
            : OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(4))),
        focusedErrorBorder: showUnderLine == true
            ? const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red))
            : OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(4))),
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        // labelStyle: TextStyle(
        //     fontSize: SizeConfig.textFontSize, color: labelFontColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: label,
        hintText: showHint == true ? title : '',
        hintStyle: TextStyle(
          fontSize: 13,
          color: labelFontColor,
        ),
        // errorText: subject.hasError ? subject.stream.error.toString() : null,
        errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
        isCollapsed: true,
        isDense: true,
        counterText: '',
        fillColor: fillColor ?? Colors.transparent,
        filled: true, // dont forget this line

      ),
      onEditingComplete: submit,
      validator: validator,
    );
  }
}
