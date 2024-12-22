import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/utils/utils.dart';

class PartnerZodiacWidget extends StatelessWidget {
  final String zodiac;
  final Gradient gradient;
  final String person;
  final String zodiacDates;
  final Function onTap;
  const PartnerZodiacWidget(
      {super.key,
      required this.zodiac,
      required this.gradient,
      required this.person,
      required this.zodiacDates,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onTap();
      },
      child: GlassmorphicContainer(
        padding: const EdgeInsets.all(16),
        blur: 10,
        height: 300,
        width: 200,
        alignment: Alignment.center,
        borderRadius: 12,
        linearGradient: AppColors.glassGradient,
        border: 0,
        borderGradient: const LinearGradient(colors: [
          Color.fromARGB(255, 9, 9, 9),
          Color.fromARGB(255, 0, 0, 0)
        ]),
        child: zodiac != ""
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    person,
                    style:
                        const TextStyle(color: AppColors.white2, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      getZodiacImage(zodiac),
                      height: 90,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    zodiac.tr,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                  Text(
                    zodiacDates,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    person,
                    style:
                        const TextStyle(color: AppColors.white2, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradient,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      size: 90,
                      color: AppColors.helpColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                  "",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                  Text(
                   "",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  ),
                ],
              ),
      ),
    ));
  }
}
