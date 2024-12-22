import 'package:get/get.dart';

class CompatibilityModel {
  final String firstZodiac;
  final String secondZodiac;
  final String compatibilityPercent;
  final String love;
  final String family;
  final String friendship;
  final String business;
  final String compatibilityMessage;

  CompatibilityModel(this.love, this.family, this.friendship, this.business,
      this.compatibilityMessage,
      {required this.firstZodiac,
      required this.secondZodiac,
      required this.compatibilityPercent});

  static List<CompatibilityModel> zodiacs = [
    //aries
    CompatibilityModel(
      "aries_aries_love".tr,
      'aries_aries_family'.tr,
      "aries_aries_friendship".tr,
      "aries_aries_business".tr,
      "aries_aries_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'aries',
      compatibilityPercent: '91%',
    ),
    CompatibilityModel(
      "aries_taurus_love".tr,
      'aries_taurus_family'.tr,
      "aries_taurus_friendship".tr,
      "aries_taurus_business".tr,
      "aries_taurus_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'taurus',
      compatibilityPercent: '81%',
    ),
    CompatibilityModel(
      "aries_gemini_love".tr,
      'aries_gemini_family'.tr,
      "aries_gemini_friendship".tr,
      "aries_gemini_business".tr,
      "aries_gemini_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'gemini',
      compatibilityPercent: '72%',
    ),
    CompatibilityModel(
      "aries_cancer_love".tr,
      'aries_cancer_family'.tr,
      "aries_cancer_friendship".tr,
      "aries_cancer_business".tr,
      "aries_cancer_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'cancer',
      compatibilityPercent: '81%',
    ),
    CompatibilityModel(
      "aries_leo_love".tr,
      'aries_leo_family'.tr,
      "aries_leo_friendship".tr,
      "aries_leo_business".tr,
      "aries_leo_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'leo',
      compatibilityPercent: '97%',
    ),

    CompatibilityModel(
      "aries_virgo_love".tr,
      'aries_virgo_family'.tr,
      "aries_virgo_friendship".tr,
      "aries_virgo_business".tr,
      "aries_virgo_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'virgo',
      compatibilityPercent: '84%',
    ),
    CompatibilityModel(
      "aries_libra_love".tr,
      'aries_libra_family'.tr,
      "aries_libra_friendship".tr,
      "aries_libra_business".tr,
      "aries_libra_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'libra',
      compatibilityPercent: '83%',
    ),
    CompatibilityModel(
      "aries_scorio_love".tr,
      'aries_scorpio_family'.tr,
      "aries_scorpio_friendship".tr,
      "aries_scorpio_business".tr,
      "aries_scorpio_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'scorpio',
      compatibilityPercent: '76%',
    ),
      CompatibilityModel(
      "aries_sagittarius_love".tr,
      'aries_sagittarius_family'.tr,
      "aries_sagittarius_friendship".tr,
      "aries_sagittarius_business".tr,
      "aries_sagittarius_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'sagittarius',
      compatibilityPercent: '92%',
    ),
       CompatibilityModel(
      "aries_capricorn_love".tr,
      'aries_capricorn_family'.tr,
      "aries_capricorn_friendship".tr,
      "aries_capricorn_business".tr,
      "aries_capricorn_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'capricorn',
      compatibilityPercent: '92%',
    ),
     CompatibilityModel(
      "aries_aquarius_love".tr,
      'aries_aquarius_family'.tr,
      "aries_aquarius_friendship".tr,
      "aries_aquarius_business".tr,
      "aries_aquarius_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'aquarius',
      compatibilityPercent: '82%',
    ),
     CompatibilityModel(
      "aries_pisces_love".tr,
      'aries_pisces_family'.tr,
      "aries_pisces_friendship".tr,
      "aries_pisces_business".tr,
      "aries_pisces_message".tr,
      firstZodiac: 'aries',
      secondZodiac: 'pisces',
      compatibilityPercent: '87%',
    ),
     CompatibilityModel(
      "taurus_gemini_love".tr,
      'taurus_gemini_family'.tr,
      "taurus_gemini_friendship".tr,
      "taurus_gemini_business".tr,
      "taurus_gemini_message".tr,
      firstZodiac: 'taurus',
      secondZodiac: 'gemini',
      compatibilityPercent: '73%',
    ),
     CompatibilityModel(
      "taurus_cancer_love".tr,
      'taurus_cancer_family'.tr,
      "taurus_cancer_friendship".tr,
      "taurus_gemini_business".tr,
      "taurus_cancer_business".tr,
      firstZodiac: 'taurus',
      secondZodiac: 'cancer',
      compatibilityPercent: '83%',
    ),
  ]; 
}
