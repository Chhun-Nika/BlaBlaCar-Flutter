import 'package:blabla/theme/theme.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final DateTime date;
  final VoidCallback onTap;
  // call back implement later
  const DatePicker({super.key, required this.date, required this.onTap});

  String get dateFormat => DateTimeUtils.formatDateTime(date);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      leading: Icon(
        Icons.calendar_month_outlined,
        size: 23,
        color: BlaColors.neutralLight,
      ),
      title: Text(dateFormat, style: TextStyle(color: BlaColors.neutral)),
    );
  }
}
