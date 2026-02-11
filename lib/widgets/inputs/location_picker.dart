import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../model/ride/locations.dart';

class LocationPicker extends StatelessWidget {
  final bool isDeparturePicker;
  final String label;
  final Location? selectedLocation;
  // adding callback function
  final VoidCallback onTap;
  final VoidCallback? onSwitchTap;

  const LocationPicker({
    super.key,
    bool? isDeparturePicker,
    required this.label,
    this.selectedLocation,
    required this.onTap,
    this.onSwitchTap
  }) : isDeparturePicker = isDeparturePicker ?? false;

  Color get labelColor =>
      selectedLocation == null ? BlaColors.neutralLight : BlaColors.neutral;

  String get title => selectedLocation == null ? label : selectedLocation!.name;

  Icon? get switchIcon => isDeparturePicker && selectedLocation != null
      ? Icon(Icons.swap_vert_outlined, size: 26, color: BlaColors.primary)
      : null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 4, color: BlaColors.neutralLight),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      title: Text(title, style: TextStyle(color: labelColor)),
      trailing: switchIcon != null
          ? IconButton(onPressed: onSwitchTap, icon: switchIcon!)
          : null,
    );
  }
}
