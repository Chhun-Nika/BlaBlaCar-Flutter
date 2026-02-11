import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class RequestedSeatInput extends StatelessWidget {
  final int requestedSeat;
  final VoidCallback onTap;
  // adding call back function
  const RequestedSeatInput({super.key, required this.requestedSeat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.person_outline, color: BlaColors.neutralLight),
      title: Text(
        requestedSeat.toString(),
        style: TextStyle(color: BlaColors.neutral),
      ),
    );
  }
}
