import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final String tarotCard;
  final String rulingPlanet;
  final String compatibility;
  final String element;

  const DescriptionWidget(
      {super.key,
      required this.description,
      required this.tarotCard,
      required this.rulingPlanet,
      required this.element,
      required this.compatibility});

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [
        infoWidget( 'rulingPlanet'.tr, rulingPlanet),
        infoWidget( 'tarotCard'.tr, tarotCard),
        infoWidget( 'element'.tr, element),
        infoWidget( 'compatibility'.tr, compatibility),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: const TextStyle(color: Colors.white,fontSize: 15),
        )
      ],
    );
  }

  Row infoWidget(String title, String sbtitle) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.heading3,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          sbtitle,
          style:  const TextStyle(color: Colors.white,fontSize: 15),
        ),
      ],
    );
  }
}
