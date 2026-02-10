import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../model/ride/locations.dart';

class LocationPicker extends StatelessWidget {
  final String label;
  final Location? seletedLocation;
  // adding callback function

  const LocationPicker({super.key, required this.label, this.seletedLocation});

  Color get labelColor =>
      seletedLocation == null ? BlaColors.neutralLight : BlaColors.neutral;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("tapppp");
      },
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
      title: Text(label, style: TextStyle(color: labelColor)),
    );
  }
}
