import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String buttonLabel;
  final IconData? icon;
  final ButtonType buttonType;
  final bool isSearchBtn;

  const BlaButton({
    super.key,
    required this.onClicked,
    required this.buttonLabel,
    this.icon,
    required this.buttonType,
    bool? isSearchBtn,
  }) : isSearchBtn = isSearchBtn ?? false;

  Color get bgColor =>
      buttonType == ButtonType.primary ? BlaColors.primary : BlaColors.white;

  Color get color =>
      buttonType == ButtonType.primary ? BlaColors.white : BlaColors.primary;

  Color get borderColor => buttonType == ButtonType.primary
      ? Colors.transparent
      : BlaColors.greyLight;

  double get padding => isSearchBtn == true ? 24 : 18;

  double get borderRadius => isSearchBtn == true ? 0 : 20;

  double get borderWidth => buttonType == ButtonType.primary ? 0 : 1.5;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(padding),
        backgroundColor: bgColor,
        side: BorderSide(color: borderColor, width: borderWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius),
        ),
      ),
      onPressed: onClicked,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(icon, color: color),
                Text(buttonLabel, style: TextStyle(color: color)),
              ],
            )
          : Text(buttonLabel, style: TextStyle(color: color)),
    );
  }
}
