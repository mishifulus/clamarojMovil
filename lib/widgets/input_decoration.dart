import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String hinttext,
    required String labeltext,
    required Icon icono,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange,)
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      hintText: hinttext,
      labelText: labeltext,
      prefixIcon: icono,
    );
  }
  
}