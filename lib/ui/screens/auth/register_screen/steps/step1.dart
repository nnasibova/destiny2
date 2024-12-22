import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/infrastructure/controller/auth_controller.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';

class Step1 extends StatelessWidget {
  final Function onTap;
  const Step1({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    AuthController ctrl = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset('assets/animations/zodiac.json', fit: BoxFit.contain),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'birthdate_register'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        ScrollDateTimePicker(
            itemExtent: 54,
            itemBuilder: (context, pattern, text, isActive, isDisabled) {
              return Text(
                text,
                style: TextStyle(
                    color: isActive ? AppColors.blue : Colors.white,
                    fontSize: 16),
              );
            },
            infiniteScroll: false,
            dateOption: DateTimePickerOption(
              dateFormat: DateFormat('yyyyMMMdd'),
              minDate: DateTime(1890, 6, 2, 2, 2),
              maxDate: DateTime.now(),
              initialDate: ctrl.dateOfBirth == DateTime(1800, 0, 0, 0)
                  ? DateTime(2001, 9, 10, 2)
                  : ctrl.dateOfBirth,
            ),
            onChange: (datetime) {
              ctrl.dateOfBirth = datetime;
            }),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: CustomButton(
            text: 'next'.tr,
            onTap: () {
              onTap();
            },
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
