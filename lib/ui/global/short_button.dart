import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_styles.dart';

class ShortButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  const ShortButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
                    onPressed: () {
                      onTap();
                    },
                    style: AppStyles.shortButton,
                    
                    child:  Text(
                      text,style: const TextStyle(color: Colors.black),
                    ),
                  );
  }
}