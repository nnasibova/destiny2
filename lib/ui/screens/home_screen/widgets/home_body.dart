import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/ui/screens/home_screen/horoscope_screen.dart';
import 'package:n9/ui/screens/home_screen/meditation_screen.dart';
import 'package:n9/ui/screens/home_screen/widgets/new_test_feature.dart';
import 'package:n9/ui/screens/home_screen/widgets/title_widget.dart';
import 'home_tabs.dart';

class HomeBody extends StatelessWidget {
  final String titleImage;
  final String titleInfo;
  final String titleName;
  final String zodiacSign;
  final String bodyHoroscope;
  final String bodyMeditation;
  final String bodyNumber;

  const HomeBody({
    super.key,
    required this.titleImage,
    required this.titleInfo,
    required this.titleName,
    required this.bodyHoroscope,
    required this.bodyMeditation,
    required this.bodyNumber,
    required this.zodiacSign,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppStyles.backgroundImage,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 160,
                  child: Image.asset(
                    'assets/images/sphere2.png',
                    color: Colors.white24,
                  )),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///title
                    TitleWidget(
                      image: titleImage,
                      info: titleInfo,
                      name: titleName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///body
                     NewCompatibilityFeature(zodiac:zodiacSign),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'yourMessage'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => HoroscopeScreen(
                                horoscope: bodyHoroscope,
                                image: titleImage,
                                signZodiac: zodiacSign.tr,
                              ));
                        },
                        child: HomeTabs(
                          title: 'horoscopeToday'.tr,
                          body: bodyHoroscope,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => MeditationScreen(zodiacSign: zodiacSign));
                      },
                      child: HomeTabs(
                        title: 'meditationMusic'.tr,
                        icon: FontAwesomeIcons.heart,
                        body: bodyMeditation,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModal('weekNumber'.tr, bodyNumber, context);
                      },
                      child: HomeTabs(
                        title: 'weekNumber'.tr,
                        icon: Icons.format_list_numbered,
                        body: bodyNumber,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModal(String title, String body, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  formatText(body),
                  style: const TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
