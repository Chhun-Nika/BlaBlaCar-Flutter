import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../model/ride/locations.dart';

class LocationPicker extends StatefulWidget {
  final String label;
  final Location? selectedLocation;
  // adding callback function
  final VoidCallback onTap;

  const LocationPicker({super.key, required this.label, this.selectedLocation, required this.onTap});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Color get labelColor => widget.selectedLocation == null
      ? BlaColors.neutralLight
      : BlaColors.neutral;

  String get title => widget.selectedLocation == null ? widget.label : widget.selectedLocation!.name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
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
    );
  }
}
