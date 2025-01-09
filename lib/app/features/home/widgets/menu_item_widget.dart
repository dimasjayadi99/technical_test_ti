import 'package:flutter/material.dart';

import '../../../core/consts/style.dart';
import '../presentation/pages/home_page.dart';

Widget buildMenuItem({
  required MenuItemModel menuItem,
  required BuildContext context,
  required Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: StyleConst.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            menuItem.iconData,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          menuItem.label,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: StyleConst.whiteColor),
        ),
      ],
    ),
  );
}
