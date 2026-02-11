import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:blabla/widgets/display/bla_divider.dart';
import 'package:blabla/widgets/inputs/location_picker.dart';
import 'package:blabla/widgets/inputs/requested_seat_input.dart';
import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import 'date_picker.dart';

class RideForm extends StatelessWidget {
  final Location? departureLocation;
  final Location? arrivalLocation;
  final DateTime date;
  final int requestedSeat;
  final VoidCallback onDepartureTap;
  final VoidCallback onArrivalTap;

  RideForm({
    super.key,
    this.departureLocation,
    this.arrivalLocation,
    DateTime? date,
    int? requestedSeat,
    required this.onDepartureTap,
    required this.onArrivalTap,
  }) : date = date ?? DateTime.now(),
       requestedSeat = requestedSeat ?? 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xl),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: BlaColors.white,
        boxShadow: [
          BoxShadow(
            color: BlaColors.greyLight,
            spreadRadius: -1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: BlaSpacings.s, left: BlaSpacings.l, right: BlaSpacings.l),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocationPicker(label: "Leaving from", onTap: onDepartureTap, selectedLocation: departureLocation,),
                BlaDivider(),
                LocationPicker(label: "Going to", onTap: onArrivalTap, selectedLocation: arrivalLocation,),
                BlaDivider(),
                DatePicker(date: date),
                BlaDivider(),
                RequestedSeatInput(requestedSeat: requestedSeat),
              ],
            ),
          ),
          BlaButton(
              onClicked: () {},
              buttonLabel: "Search",
              buttonType: ButtonType.primary,
              isSearchBtn: true,
            ),
        ],
      ),
    );
  }
}
