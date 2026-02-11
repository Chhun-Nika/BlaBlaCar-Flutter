import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class SelectSeatsNumberScreen extends StatefulWidget {
  final int requestedSeat;
  const SelectSeatsNumberScreen({super.key, required this.requestedSeat});

  @override
  State<SelectSeatsNumberScreen> createState() =>
      _SelectSeatsNumberScreenState();
}

class _SelectSeatsNumberScreenState extends State<SelectSeatsNumberScreen> {
  late int requestedSeat;

  Color get color =>
      requestedSeat <= 1 ? BlaColors.disabled : BlaColors.primary;

  @override
  void initState() {
    super.initState();
    requestedSeat = widget.requestedSeat;
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
              onPressed: () {},
              icon: Icon(
                Icons.clear_rounded,
                size: 30,
                color: BlaColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    padding: EdgeInsets.only(left: BlaSpacings.s),
                    child: Text(
                      "Number of seats to book",
                      style: BlaTextStyles.heading.copyWith(
                        color: BlaColors.neutralDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: BlaSpacings.s),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(width: 1, color: color),
                            ),
                          ),
                          onPressed: () {
                            // if (requestedSeat <= 1) null;
                            setState(() {
                              if (requestedSeat > 1) {
                                requestedSeat--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove, color: color),
                        ),
                        Text(
                          requestedSeat.toString(),
                          style: BlaTextStyles.heading.copyWith(
                            color: BlaColors.neutralDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 38,
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                width: 1,
                                color: BlaColors.primary,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              requestedSeat++;
                            });
                          },
                          icon: Icon(Icons.add, color: BlaColors.primary),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: BlaButton(
                      onClicked: () {
                        Navigator.pop(context, requestedSeat);
                      },
                      buttonLabel: "Confirm",
                      buttonType: ButtonType.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
