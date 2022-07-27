import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(String data);

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextStyle labelStyle;
  final bool obscureText;
  final OnChangeCallback? onChangedMethod;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.labelStyle,
    required this.onChangedMethod,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
      ),
      onChanged: onChange,
    );
  }

  void onChange(String value) {
    onChangedMethod?.call(value);
  }
}
