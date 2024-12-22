import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/extensions.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:n9/ui/global/custom_text_field.dart';

class Step3 extends StatelessWidget {
  final TextEditingController locationController;
  final Function onTap;
  const Step3(
      {super.key, required this.onTap, required this.locationController});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'noInfo'.tr;
                  }
                  if (!val.isValidName) {
                    return 'validCity'.tr;
                  }

                  return null;
                },
                inputType: TextInputType.streetAddress,
                question: 'cityQuestion'.tr,
                text: 'city'.tr,
                controller: locationController),
            const Spacer(),
            CustomButton(
              text: 'next'.tr,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  onTap();
                }
              },
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
