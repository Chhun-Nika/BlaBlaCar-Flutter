import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';

class LocationTile extends StatelessWidget {
  // final bool isHistory;
  final Location location;
  const LocationTile({super.key, required this.location});

  // Icon? get icon => isHistory == true ? Icon(Icons.history) : null;
  @override
  Widget build(BuildContext context) {
    void onTapped() {
      Navigator.pop<Location>(context, location);
    }

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: BlaSpacings.l, vertical: BlaSpacings.s),
          // leading: icon,
          title: Text(
            location.name,
            style: TextStyle(
              color: BlaColors.neutralDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            location.country.name,
            style: TextStyle(color: BlaColors.neutralLight),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            size: 30,
            color: BlaColors.neutralLight,
          ),
          onTap: () {
            onTapped();
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: BlaSpacings.l),
          child: BlaDivider(),
        ),
      ],
    );
  }
}
