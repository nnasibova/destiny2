import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/infrastructure/controller/auth_controller.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';

class Step2 extends StatelessWidget {
  final Function onTap;
  const Step2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    AuthController ctrl = Get.find();

    return SingleChildScrollView(
      child: Column(
        children: [
          Lottie.asset(
            'assets/animations/planets.json',
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'timeQuestion'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                ScrollDateTimePicker(
                    itemExtent: 54,
                    itemBuilder:
                        (context, pattern, text, isActive, isDisabled) {
                      return Text(
                        text,
                        style: TextStyle(
                            color: isActive ? AppColors.blue : Colors.white,
                            fontSize: 16),
                      );
                    },
                    infiniteScroll: true,
                    dateOption: DateTimePickerOption(
                      dateFormat: DateFormat('HH:mm'),
                      minDate: DateTime(0, 1, 1, 0, 0), // set min time
                      maxDate: DateTime(0, 1, 1, 23, 59), // set max time
                      initialDate: ctrl.timeOfBirth ==
                              DateTime(
                                1800,
                                0,
                                0,
                                0,
                              )
                          ? DateTime(1890, 1, 1, 12, 0)
                          : ctrl.timeOfBirth, // set initial time
                    ),
                    onChange: (datetime) {
                      ctrl.timeOfBirth = DateTime(
                        0,
                        1,
                        1,
                        datetime.hour,
                        datetime.minute,
                      );
                    }),
                const SizedBox(
                  height: 32,
                ),
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
            ),
          ),
        ],
      ),
    );
  }
}
