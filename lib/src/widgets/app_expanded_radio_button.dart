import 'package:flutter/material.dart';
import 'app_text.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppExpandedRadioButton extends StatelessWidget {
  final Color? activeColor;
  final Color? inactiveColor;
  final GestureTapCallback onTap;
  final String label;
  final TextStyle? labelStyle;
  final double labelFontSize;
  final Color labelFontColor;
  final bool isSelected;

  const AppExpandedRadioButton(
      {Key? key,
      this.activeColor,
      this.inactiveColor,
      required this.onTap,
      required this.label,
      this.labelStyle,
      required this.labelFontSize,
      required this.labelFontColor,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: AppText(
                  label: label,
                  style: labelStyle ??
                      const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
            ),
            const SizedBox(width: 4),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: isSelected
                          ? activeColor ?? Colors.blue
                          : inactiveColor ?? Colors.grey,
                      width: 2),
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(4),
              child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: isSelected ? activeColor : Colors.white,
                      shape: BoxShape.circle)),
            ),
          ],
        ),
      ),
    );
  }
}
