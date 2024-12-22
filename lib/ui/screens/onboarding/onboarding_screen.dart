import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:n9/ui/screens/auth/register_screen/register_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: AppStyles.backgroundImage,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('welcome'.tr, style: AppTextStyles.heading2),
                  Text('appName'.tr, style: AppTextStyles.heading1),
                  Image.asset('assets/images/sphere2.png'),
                  Text(
                    'appSlogan'.tr,
                    style: AppTextStyles.heading3,
                  ),
                  const SizedBox(height: 30,),
                  CustomButton(text: 'start'.tr, onTap: (){
                    Get.to(()=> RegisterScreen(),transition: Transition.rightToLeft);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
