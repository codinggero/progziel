import 'package:flutter/material.dart';
import '/package.dart';

class Chips extends StatelessWidget {
  final String label;
  final int index;
  final int selected;
  final double fontSize;
  final void Function()? onPressed;

  const Chips({
    super.key,
    this.label = '',
    this.index = 0,
    this.selected = 0,
    this.fontSize = 18.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      selected: selected == index ? true : false,
      onPressed: onPressed,
      disabledColor: App.dimGray,
      backgroundColor: App.white,
      selectedColor: selected == index ? App.green : App.dimGray,
      showCheckmark: false,
      padding: EdgeInsets.all(App.padding / 2),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selected == index ? App.green : App.dimGray,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: selected == index ? App.white : App.blackRussian,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
