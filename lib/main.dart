import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/service/rides_service.dart';
import 'package:flutter/material.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
  // Location dijon = Location(country: Country.france, name: "Dijon");

  // List<Ride> filteredRide = RidesService.filterBy();

  // for (Ride ride in filteredRide) {
  //   print(ride);
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
