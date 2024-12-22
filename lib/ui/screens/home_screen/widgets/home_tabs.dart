import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';
import 'package:n9/helpers/utils/utils.dart';

class HomeTabs extends StatelessWidget {
  final String title;
  final String body;
  final IconData? icon;
  const HomeTabs({
    super.key,
    this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 255, 255, 255),
        // Color.fromARGB(255, 35, 35, 36),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white54),
      ),
      child: ListTile(
          leading: icon == null
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.blueAccent.shade100, Colors.white],
                    ).createShader(bounds);
                  },
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                          text: extractMonth(DateTime.now()),
                          children: [
                        const TextSpan(text: '\n'),
                        TextSpan(text: extractDayWithOrdinal(DateTime.now()))
                      ])))
              : Icon(
                  icon,
                  size: 46,
                  color: AppColors.helpColor,
                ),
          title: Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 247, 235, 235),
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          subtitle: Text(
            body,
            style: AppTextStyles.heading3.copyWith(color: Colors.grey.shade200),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
