import 'dart:math';

import 'package:flutter/material.dart';

//final Color tPrimaryColor = Color.fromARGB(255, 53, 134, 106);
final Color tBackgroundButtonColor = Color.fromARGB(255, 71, 71, 71);
final Color tLightRed = Color.fromARGB(255, 245, 197, 203);
final Color tListTile = Color.fromARGB(255, 236, 255, 248);
final Color tPink = Color.fromARGB(255, 250, 178, 229);
final Color tPrimaryColor = Color.fromARGB(255, 41, 225, 210);
final Color tSecondaryColor = Color.fromARGB(255, 143, 224, 196);
final Color tSnackBarNotOk = Color.fromARGB(255, 245, 197, 203);
final Color tSnackBarOk = Color.fromARGB(255, 213, 240, 197);
final Color tDark = Color.fromARGB(255, 65, 65, 65);
final Color tTestColor = Color.fromARGB(255, 128, 133, 239);
final Color tTextColor = Color.fromARGB(255, 92, 92, 92);
final Color tWhite = Color.fromARGB(255, 255, 255, 255);
final Color tBlack = Color.fromARGB(255, 0, 0, 0);

//Color schema:

final Color tBlueS = Color.fromARGB(255, 186, 208, 255);
final Color tDarkPurpleS = Color.fromARGB(255, 186, 145, 249);
final Color tGreenS = Color.fromARGB(255, 72, 243, 140);
final Color tPinkS = Color.fromARGB(255, 255, 130, 213);
final Color tPurpleS = Color.fromARGB(255, 200, 123, 255);
final Color tTurkS = Color.fromARGB(255, 0, 255, 204);
final Color tYellowS = Color.fromARGB(255, 255, 236, 128);

final List<Color> colorList = [
  tBlueS,
  tDarkPurpleS,
  tPurpleS,
  tPinkS,
  tGreenS,
  tTurkS,
  // tRedS,
  // tOrangeS,
  tYellowS
];

Color generateRandomColor() {
  final randomColor = Random();
  var tRandomColor = colorList[randomColor.nextInt(colorList.length)];
  return tRandomColor;
}
