import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class DatePickerScreen extends StatelessWidget {
  final DateTime date;
  const DatePickerScreen({super.key, required this.date});

  DateTime onDateChanged(DateTime value) {
    print(value);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: BlaSpacings.s,
          left: BlaSpacings.s,
          right: BlaSpacings.s,
          bottom: BlaSpacings.xxl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context, date);
              },
              icon: Icon(
                Icons.clear_rounded,
                size: 30,
                color: BlaColors.primary,
              ),
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2027),
              onDateChanged: onDateChanged,
            ),
          ],
        ),
      ),
    );
  }
}
