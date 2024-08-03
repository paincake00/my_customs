import 'package:flutter/material.dart';

abstract class LightColorPalette {
  static const Color backgroundPage = Colors.white;
  static const Color backgroundBar = Colors.white;
  static const Color borderBar = Colors.black;
  static const Color iconMain = Color.fromARGB(255, 97, 97, 97);
  static const Color textSort = Colors.black;
  static const Color textSearch = Colors.grey;
  static const Color delete = Colors.red;
  static const Color archiveStart = Color.fromARGB(255, 158, 158, 158);
  static const Color archiveEnd = Color.fromARGB(255, 117, 117, 117);
}

abstract class DarkColorPalette {
  static const Color backgroundPage = Color.fromARGB(255, 33, 33, 33);
  static const Color backgroundBar = Color.fromARGB(255, 33, 33, 33);
  static const Color borderBar = Colors.white;
  static const Color iconMain = Colors.white;
  static const Color textSort = Colors.white;
  static const Color textSearch = Colors.grey;
  static const Color delete = Colors.red;
  static const Color archiveStart = Color.fromARGB(255, 158, 158, 158);
  static const Color archiveEnd = Color.fromARGB(255, 117, 117, 117);
}

abstract class PurpleColorPalette {
  static const Color lightMainColor = Color.fromARGB(255, 171, 71, 188);
  static const Color mainColor = Color.fromARGB(255, 142, 36, 170);
  static const Color buttonBack = Color.fromARGB(255, 255, 165, 255);
  static const Color textForm = Colors.white;
  static const Color buttonFront = Colors.black;
}

abstract class BlueColorPalette {
  static const Color lightMainColor = Color.fromARGB(255, 71, 79, 188);
  static const Color mainColor = Color.fromARGB(255, 36, 36, 170);
  static const Color buttonBack = Color.fromARGB(255, 165, 192, 255);
  static const Color textForm = Colors.white;
  static const Color buttonFront = Colors.black;
}
