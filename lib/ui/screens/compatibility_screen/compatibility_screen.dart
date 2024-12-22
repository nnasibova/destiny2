import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/modals/modal_helpers.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/compatibility_controller.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:n9/ui/screens/compatibility_screen/components/partner_zodiac_widget.dart';

class CompatibilityScreen extends StatelessWidget {
  final String zodiacSign;
  const CompatibilityScreen({Key? key, required this.zodiacSign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompatibilityController ctrl = Get.put(CompatibilityController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppStyles.backgroundImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              children: [
                PartnerZodiacWidget(
                    onTap: () {},
                    zodiac: zodiacSign,
                    gradient: AppColors.zodiacGradient,
                    person: "me".tr,
                    zodiacDates: getZodiacMonthes(zodiacSign)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: AppColors.helpColor,
                    size: 14,
                  ),
                ),
                Obx(() {
                  return PartnerZodiacWidget(
                      onTap: () {
                        ModalHelpers.showZodiacSelecter(
                          context,
                        );
                      },
                      person: 'lover'.tr,
                      zodiac: ctrl.hisZodiac.value,
                      zodiacDates: getZodiacMonthes(ctrl.hisZodiac.value),
                      gradient: AppColors.zodiacSecondGradient);
                }),
              ],
            ),
            const Spacer(),
            CustomButton(
              text: 'check_compatibility'.tr,
              onTap: () {},
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
