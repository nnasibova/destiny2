import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/ui/global/custom_button.dart';

class Step4 extends StatelessWidget {
  final Function onTap;

  const Step4({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            'statistics_heading'.tr,
            style: const TextStyle(
                color: AppColors.white2,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.blue2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("statistics_title".tr,
                      style: const TextStyle(
                          color: AppColors.white2,
                          fontSize: 15,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blue),
                        child:  Text(
                          'N',
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Nazrin Hasanli',
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w200),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 32,
          ),
          Text(
            "statistics_subtitle".tr,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400],
            ),
            textAlign: TextAlign.center ,
          ),
          const Spacer(),
         CustomButton(
              text: 'next'.tr,
              onTap: () {
                onTap();
              },
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 16,
            )
        ],
      ),
    );
  }
}
