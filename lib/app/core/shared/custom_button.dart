import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/core/consts/style.dart';

class CustomButton {
  SizedBox fillButton(BuildContext context, String label, VoidCallback onTap) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: StyleConst.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  SizedBox outlineButton(
      BuildContext context, String label, VoidCallback onTap) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: StyleConst.whiteColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
