import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:blabla/widgets/display/bla_divider.dart';
import 'package:blabla/widgets/inputs/location_picker.dart';
import 'package:blabla/widgets/inputs/requested_seat_input.dart';
import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import '../../screens/location/location_search_screen.dart';
import 'date_picker.dart';

class RideForm extends StatefulWidget {
  final RidePref? ridePref;

  const RideForm({super.key, this.ridePref});

  @override
  State<RideForm> createState() => _RideFormState();
}

class _RideFormState extends State<RideForm> {
  Location? departureLocation;
  Location? arrivalLocation;
  // allow us to initialize the value later (but it is not null)
  late DateTime date;
  late int requestedSeat;

  @override
  void initState() {
    super.initState();
    departureLocation = widget.ridePref?.departure;
    arrivalLocation = widget.ridePref?.arrival;
    date = widget.ridePref?.departureDate ?? DateTime.now();
    requestedSeat = widget.ridePref?.requestedSeats ?? 1;
  }

  void setDepartureLocation() async {
    final selectedDepartureLocation = await Navigator.push<Location>(
      context,
      MaterialPageRoute(
        builder: (context) => LocationSearchScreen(
          defaultLocation: departureLocation,
        ),
      ),
    );
    setState(() {
      departureLocation = selectedDepartureLocation;
    });
  }

  void setArrivalLocation() async {
    final selectedArrivalLocation = await Navigator.push<Location>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LocationSearchScreen(defaultLocation: arrivalLocation),
      ),
    );
    setState(() {
      arrivalLocation = selectedArrivalLocation;
    });
  }

  void onSwitchTap() {
    final Location? tmpLocation = departureLocation;
    setState(() {
      departureLocation = arrivalLocation;
      arrivalLocation = tmpLocation;
    });
  }

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
            padding: EdgeInsets.only(
              top: BlaSpacings.s,
              left: BlaSpacings.l,
              right: BlaSpacings.l,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocationPicker(
                  isDeparturePicker: true,
                  label: "Leaving from",
                  onTap: setDepartureLocation,
                  selectedLocation: departureLocation,
                  onSwitchTap: onSwitchTap,
                ),
                BlaDivider(),
                LocationPicker(
                  label: "Going to",
                  onTap: setArrivalLocation,
                  selectedLocation: arrivalLocation,
                ),
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
