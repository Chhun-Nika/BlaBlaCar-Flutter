import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/screens/date/date_picker_screen.dart';
import 'package:blabla/screens/ride/ride_screen.dart';
import 'package:blabla/screens/select_seats_number/select_seats_number_screen.dart';
import 'package:blabla/theme/theme.dart';
import 'package:blabla/utils/animations_util.dart';
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

  Future<void> setDepartureLocation() async {
    final selectedDepartureLocation = await Navigator.push<Location>(
      context,
      // MaterialPageRoute(
      //   builder: (context) => LocationSearchScreen(
      //     defaultLocation: departureLocation,
      //   ),
      // ),
      AnimationUtils.createBottomToTopRoute(
        LocationSearchScreen(defaultLocation: departureLocation),
      ),
    );
    setState(() {
      departureLocation = selectedDepartureLocation;
    });
  }

  Future<void> setArrivalLocation() async {
    final selectedArrivalLocation = await Navigator.push<Location>(
      context,
      // MaterialPageRoute(
      //   builder: (context) =>
      //       LocationSearchScreen(defaultLocation: arrivalLocation),
      // ),
      // apply animation
      AnimationUtils.createBottomToTopRoute(
        LocationSearchScreen(defaultLocation: arrivalLocation),
      ),
    );
    setState(() {
      arrivalLocation = selectedArrivalLocation;
    });
  }

  Future<void> setRequestedSeats() async {
    final newRequestedSeats = await Navigator.push(
      context,
      AnimationUtils.createBottomToTopRoute(
        SelectSeatsNumberScreen(requestedSeat: requestedSeat),
      ),
    );

    setState(() {
      requestedSeat = newRequestedSeats;
    });
  }

  void setDate() async {
    final newDate = await Navigator.push(
      context,
      AnimationUtils.createBottomToTopRoute(DatePickerScreen(date: date)),
    );
  }

  void onSwitchTap() {
    final Location? tmpLocation = departureLocation;
    setState(() {
      departureLocation = arrivalLocation;
      arrivalLocation = tmpLocation;
    });
  }

  bool isSwitchIconVisible() {
    if (departureLocation != null || arrivalLocation != null) {
      return true;
    }
    return false;
  }

  void onSearch() async {
    if (departureLocation == null) {
      setDepartureLocation();
    } else if (arrivalLocation == null) {
      setArrivalLocation();
    } else {
      final ridePref = RidePref(
        departure: departureLocation!,
        departureDate: date,
        arrival: arrivalLocation!,
        requestedSeats: requestedSeat,
      );
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RideScreen(ridePref: ridePref)),
      );
    }
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
                  isSwitchIconVisible: isSwitchIconVisible(),
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
                DatePicker(date: date, onTap: setDate),
                BlaDivider(),
                RequestedSeatInput(
                  requestedSeat: requestedSeat,
                  onTap: setRequestedSeats,
                ),
              ],
            ),
          ),
          BlaButton(
            onClicked: onSearch,
            buttonLabel: "Search",
            buttonType: ButtonType.primary,
            isSearchBtn: true,
          ),
        ],
      ),
    );
  }
}
