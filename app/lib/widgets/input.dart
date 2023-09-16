import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderSide borderSide;
  final BorderRadius borderRadius;
  final double gapPadding;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const Input({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.suffixIcon,
    this.borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.gapPadding = 4.0,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      textAlign: textAlign,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
