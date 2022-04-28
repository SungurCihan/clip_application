import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Color clipPink = const Color(0xffFF007F); //* used
  final Color weatheredStone = const Color(0xffC4C4C4); //*used
  final Color brandeisBlue = const Color(0xff006FFF); //*used
  final Color cyrastalFalls = const Color(0xffE1E3F2); //*used
  final Color pearlGrey = const Color(0xffF8F8F8); //*used
  final Color white = const Color(0xffffffff); //*used
  final Color bananaCream = const Color(0xffFFF899); //*used
  final Color red = const Color(0xffFFF899); //*used
  final Color sailorMoon = const Color(0xffFFEE00); //*used
  final Color black = Colors.black; //*used
  final Color grey = Colors.grey; //*used
  final Color battleToad = const Color(0xff18CB4E); //*used
  final Color amberAccent = Colors.blue;

  final Brightness lightBright = Brightness.light;
  final Brightness lightDark = Brightness.dark;
}
