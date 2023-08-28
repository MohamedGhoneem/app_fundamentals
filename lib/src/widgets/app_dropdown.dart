import 'dart:convert';
import 'package:flutter/material.dart';
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
  final VoidCallback? onTap;
  final bool? readOnly;
  final Color? dropdownColor;

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
      this.onTap,
      this.readOnly = false,
      this.dropdownColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      elevation: 0,
      isExpanded: true,
      value: selectedItem,
      validator: validator,
      // alignment: Alignment.bottomRight,
      dropdownColor: dropdownColor??Colors.grey,
      hint: AppText(
        label: hint ?? '',
        style: style ??
            const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
      ),
      style: style??const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8)),
      icon: icon ??
          const Icon(
            Icons.keyboard_arrow_down,
            size: 15,
            color: Colors.black ,
          ),
      onTap: onTap,
      items: items.map((T data) {
        var map = Map<String, dynamic>.from(json.decode(json.encode(data)));
        return DropdownMenuItem(
          value: data,
          child: AppText(
            label: '${map[titleKey]}',
            style: style ??
                const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.none),
          ),
        );
      }).toList(),
      onChanged: readOnly == true ? null : onChange,
    );
  }
}
