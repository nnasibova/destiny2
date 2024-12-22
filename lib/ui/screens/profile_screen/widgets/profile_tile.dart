import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_colors.dart';

class ProfileTile extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color? color;
  final String text;
  const ProfileTile(
      {super.key, required this.onTap, required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: Icon(icon, color: color ?? AppColors.helpColor,),
        title: Text(text,style: TextStyle(color: color ?? Colors.white),),
        trailing: color != null ? const SizedBox():  const Icon(Icons.arrow_forward_ios,color: AppColors.helpColor,size:14),
      ),
    );
  }
}
