import 'package:flutter/material.dart';

import 'package:n9/helpers/constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextInputType? inputType;
  final IconData? suffixIcon;
  final Function? onTap;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.text,
    this.inputType,
    this.suffixIcon,
    this.validator,
    required this.controller, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius border = const BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10));
    return TextFormField(
      cursorColor: AppColors.helpColor,
      maxLines: null,
      validator: validator,
      keyboardType: inputType ?? TextInputType.name,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
              icon: Icon(suffixIcon) ,
                color: Colors.white54,
                onPressed: (){
              onTap!();
                },
              ),
        contentPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.black,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:AppColors.helpColor),
            borderRadius: border),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:AppColors.helpColor),
            borderRadius: border),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: border,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: border,
        ),
      ),
    );
  }
}
