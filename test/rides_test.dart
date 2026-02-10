
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/service/rides_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Location dijon = Location(country: Country.france, name: "Dijon");

  // List<Ride> filteredRide = RidesService.filterBy();

  // for (Ride ride in filteredRide) {
  //   // print(ride);
  // }
  group("Ride Filter", () {
    Location l1 = Location(country: Country.france, name: "Dijon");
    Location l2 = Location(name: "London", country: Country.uk);

    test("filter ride with non-existed location ", () {
      final result = RidesService.filterBy(departure: l1);
      expect(result.isEmpty, false);
    });

    test("filter ride with existing location", () {
      final result = RidesService.filterBy(departure: l2);
      expect(result.isNotEmpty, true);
      for (Ride ride in result) {
        expect(ride.departureLocation, l2);
      }
    });

    test("filter ride with proper location with available seats", () {
      final result = RidesService.filterBy(departure: l2, seatRequested: 2);
      for (final ride in result) {
        expect(ride.departureLocation, l2);
        expect(ride.remainingSeats >= 2, true);
      }
    });
  });
}
