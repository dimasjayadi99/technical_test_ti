import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/core/consts/style.dart';

class CustomTextField {
  TextFormField generalForm(String hint, String label, IconData prefixIcon,
      TextEditingController controller, TextInputType inputType) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: StyleConst.whiteColor),
          prefixIcon: Icon(prefixIcon),
          hintText: hint,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      validator: (value) {
        if (value == '') {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }

  TextFormField passwordForm(String hint, String label, IconData prefixIcon,
      TextEditingController controller) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: StyleConst.whiteColor),
          prefixIcon: Icon(prefixIcon),
          hintText: hint,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      validator: (value) {
        if (value == '') {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }
}
