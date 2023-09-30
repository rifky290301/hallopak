import 'package:flutter/material.dart';

class AppGradients {
  static Gradient primary2 = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF53E88B),
      Color(0xFF15BE77),
    ],
  );

  static Gradient primary = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFC5AD89),
      Color(0xFFADAF9A),
    ],
  );

  static Gradient primary3 = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFA28354),
      Color(0xFFA28354),
    ],
  );
}
