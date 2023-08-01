import 'package:flutter/material.dart';

class AppShadow {
  static BoxShadow get appShadowList => BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 3,
        offset: const Offset(0, 2),
      );
}
