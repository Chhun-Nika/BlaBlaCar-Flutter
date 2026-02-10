import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class BlaButtonTestScreen extends StatelessWidget {
  const BlaButtonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.all(50),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlaButton(
            onClicked: () {
              print("Primary btn without icon");
            },
            buttonLabel: "Primary button",
            buttonType: ButtonType.primary,
          ),
          BlaButton(
            onClicked: () {
              print("Secondary btn without icon");
            },
            buttonLabel: "Secondary button",
            buttonType: ButtonType.secondary,
          ),
          BlaButton(
            onClicked: () {
              print("Primary btn with icon");
            },
            icon: Icons.schedule,
            buttonLabel: "Primary button + icon",
            buttonType: ButtonType.primary,
          ),
          BlaButton(
            onClicked: () {
              print("Secondary btn with icon");
            },
            icon: Icons.calendar_month,
            buttonLabel: "Secondary button + icon",
            buttonType: ButtonType.secondary,
          ),
        ],
      ),
    );
  }
}
