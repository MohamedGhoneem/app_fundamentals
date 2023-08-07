import 'dart:convert';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../size_config.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppDropdown<T> extends StatelessWidget {
  final String? title;
  final String titleKey;
  final String? hint;
  final List<T> items;
  final T? selectedItem;
  final ValueChanged onChange;
  final FormFieldValidator<T> validator;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool? readOnly;

  const AppDropdown(
      {Key? key,
      this.title,
      required this.titleKey,
      this.hint,
      required this.items,
      this.selectedItem,
      required this.onChange,
      required this.validator,
      this.style,
      this.icon,
      this.iconColor,
      this.onTap,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      elevation: 0,
      isExpanded: true,
      value: selectedItem,
      validator: validator,
      // alignment: Alignment.bottomRight,
      dropdownColor: AppColors.getBackGroundColor(),
      hint: AppText(
        label: hint ?? '',
        style: style ??
            TextStyle(
              fontSize: 14,
              color: AppColors.getFontColor(),
            ),
      ),
      style: TextStyle(
        fontSize: 14,
        color: AppColors.getFontColor(),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8)),
      icon: icon ??
          Icon(
            Icons.keyboard_arrow_down,
            size: SizeConfig.iconSize,
            color: iconColor ?? AppColors.getFontColor(),
          ),
      onTap: onTap,
      items: items.map((T data) {
        var map = Map<String, dynamic>.from(json.decode(json.encode(data)));
        return DropdownMenuItem(
          value: data,
          child: AppText(
            label: '${map['flag'] ?? ''} ${map[titleKey]}',
            style: style ??
                TextStyle(
                    fontSize: 14,
                    color: AppColors.getFontColor(),
                    decoration: TextDecoration.none),
          ),
        );
      }).toList(),
      onChanged: readOnly == true ? null : onChange,
    );
  }
}
