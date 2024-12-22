import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/ui/screens/compatibility_screen/compatibility_screen.dart';

class NewCompatibilityFeature extends StatelessWidget {
  final String zodiac;
  const NewCompatibilityFeature({super.key, required this.zodiac});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CompatibilityScreen(zodiacSign: zodiac),
            transition: Transition.rightToLeft);
      },
      child: GlassmorphicContainer(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 200,
        borderRadius: 12,
        linearGradient: const LinearGradient(
          colors: [
            Color(0xFF1E2226), // Main color
            Color(0xFF2A2E32),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: 8,
        blur: 2,
        borderGradient: LinearGradient(
          colors: [
            const Color(0xFF1E2226)
                .withOpacity(0.5), // Semi-transparent main color
            Colors.white.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.heartCircleCheck,
              size: 45,
              color: AppColors.white2,
            ),
            const SizedBox(height: 20),
            Text(
              "check_love".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "explore_with_tests".tr,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
