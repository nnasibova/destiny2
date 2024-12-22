import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? width;
  const CustomButton({super.key, required this.text, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
          style: AppStyles.buttonStyle,
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
