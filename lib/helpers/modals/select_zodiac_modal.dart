import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';
import 'package:n9/infrastructure/controller/compatibility_controller.dart';
import 'package:n9/infrastructure/model/sign_zodiac_model.dart';

class SelectZodiacCompatibility extends StatelessWidget {
  const SelectZodiacCompatibility({super.key});

  @override
  Widget build(BuildContext context) {
    CompatibilityController ctrl = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'select_zodiac'.tr,
                style: AppTextStyles.heading1.copyWith(color: AppColors.white2),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 3,
                mainAxisExtent: 150,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  final data =  SignZodiacModel.zodiacs[i];
                  return Obx(() {
                    bool isSelected = ctrl.hisZodiac.value == data.signZodiac!;

                    return GestureDetector(
                      onTap: () {
                        ctrl.hisZodiac.value = data.signZodiac!;
                        Get.back();
                      },
                      child: GlassmorphicContainer(
                        padding: const EdgeInsets.all(16),
                        height: 100,
                        width: 200,
                        blur: 10,
                        alignment: Alignment.center,
                        borderRadius: 12,
                        linearGradient: LinearGradient(colors: [
                          const Color(0xff15203E),
                          isSelected
                              ? AppColors.blue
                              : const Color.fromARGB(255, 23, 29, 54)
                        ]),
                        border: 0,
                        borderGradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 9, 9, 9),
                          Color.fromARGB(255, 0, 0, 0)
                        ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(data.image!)),
                            Text(
                              data.signZodiac!.tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              data.birthDate!,
                              style: const TextStyle(
                                  color: AppColors.helpColor, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                childCount:  SignZodiacModel.zodiacs.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white2),
                  child: const Icon(FontAwesomeIcons.xmark),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
