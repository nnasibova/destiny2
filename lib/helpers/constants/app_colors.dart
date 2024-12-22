import 'package:flutter/material.dart';

class AppColors {
  static const Color helpColor = Color(0xffbdbdbd);
  static const Color backgroundColor = Colors.black;
  static const Color mainColor = Color.fromARGB(255, 17, 19, 22);
  static const Color blue2 = Color(0xff5998EF);
  static const Color blue = Color.fromARGB(255, 26, 91, 176);
  static const Color white2 = Color.fromARGB(219, 255, 255, 255);

  static const glassGradient = LinearGradient(colors: [
    Color(0xFF1E2226), // Main color
    Color(0xFF2A2E32),
  ]);

  static const zodiacGradient = LinearGradient(
    colors: [
      Color(0xff31326F),
      Color(0xff31326F),

      Color(0xFF1E2226), // Main color
      Color(0xFF2A2E32),
    ],
    begin: FractionalOffset(0.3, 0.2),
    end: FractionalOffset(0.8, 0.5),
  );

  static const zodiacSecondGradient = LinearGradient(
    colors: [
      Color(0xFF1E2226),
      Color(0xFF2A2E32),
      Color(0xFF1D406C),
      Color(0xFF1D406C),
    ],
    begin: FractionalOffset(0.2, 0.3),
    end: FractionalOffset(0.5, 0.8),
  );
}
