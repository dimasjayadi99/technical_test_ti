import 'package:flutter/material.dart';

import '../consts/style.dart';
import 'gap.dart';

class CustomDivider {
  Divider basicDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget styleDivider() {
    return Column(
      children: [
        const Gap.v(h: 16),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                StyleConst.blackColor,
                StyleConst.whiteColor.withOpacity(0.3),
                StyleConst.blackColor,
              ],
              stops: const [
                0.0,
                0.5,
                1.0,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const Gap.v(h: 16),
      ],
    );
  }
}
