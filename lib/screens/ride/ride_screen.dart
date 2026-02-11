import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class RideScreen extends StatelessWidget {
  final RidePref ridePref;
  const RideScreen({super.key, required this.ridePref});
  String get time => DateTimeUtils.formatTime(ridePref.departureDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: BlaSpacings.m,
              left: BlaSpacings.l,
              right: BlaSpacings.l,
            ),

            color: Colors.grey[200],
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left_rounded,
                  size: 30,
                  color: BlaColors.neutralLight,
                ),
              ),
              title: Text("Ride Screen")
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(BlaSpacings.l),
            color: Colors.tealAccent,
            padding: EdgeInsets.all(BlaSpacings.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Departure: ${ridePref.departure.name}'),
                Text('Arrival: ${ridePref.arrival.name}'),
                Text('Time: $time'),
                Text('Requested Seats: ${ridePref.requestedSeats}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
