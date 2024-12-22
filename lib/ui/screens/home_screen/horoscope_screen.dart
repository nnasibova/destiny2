import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';
import 'package:n9/helpers/utils/utils.dart';

class HoroscopeScreen extends StatelessWidget {
  final String signZodiac, horoscope, image;
  const HoroscopeScreen(
      {super.key,
      required this.signZodiac,
      required this.horoscope,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Image.network(
                      image,
                      height: 100,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(signZodiac,
                        style: const TextStyle(fontSize: 38, color: Colors.white70)),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        getCurrentDateRangeInAzerbaijani(),
                        style: AppTextStyles.heading3
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'horoscopeToday'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Text(
                formatText(horoscope),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
