import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_colors.dart';

class AppStyles {
  static BoxDecoration backgroundImage = const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            'assets/images/background.jpg',
          ),
          fit: BoxFit.fill));
  static ButtonStyle buttonStyle = ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    ),
    backgroundColor: WidgetStateProperty.all(AppColors.blue),
    padding:
        WidgetStateProperty.all(const EdgeInsets.only(top: 12, bottom: 12)),
  );

  static BoxDecoration hubDecoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      color: Colors.white10);

  static ButtonStyle shortButton = ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Set a fixed border radius
      ),
    ),
    overlayColor: WidgetStateProperty.all(Colors.white),
    backgroundColor: WidgetStateProperty.all(AppColors.helpColor),
  );
}
