import 'package:flutter/material.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(Location departure) {
    return fakeRides
        .where((ride) => ride.departureLocation.name == departure.name)
        .toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(int requestedSeat) {
    return fakeRides
        .where((ride) => ride.availableSeats >= requestedSeat)
        .toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return fakeRides.where((ride) {
      if (departure == null || seatRequested == null) {
        return false;
      }

      if (ride.departureLocation.name != departure.name) {
        return false;
      }

      if (ride.remainingSeats < seatRequested) {
        return false;
      }

      return true;
    }).toList();
  }
}
