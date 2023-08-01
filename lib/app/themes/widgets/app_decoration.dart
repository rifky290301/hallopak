import 'package:flutter/cupertino.dart';

class AppDecoration {
  static BoxDecoration get appHeader => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image/bg_appbar.png'),
          opacity: 0.2,
          alignment: Alignment.topCenter,
        ),
      );
}
