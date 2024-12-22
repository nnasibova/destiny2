import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/extensions.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:n9/ui/global/custom_text_field.dart';

class Step5 extends StatelessWidget {
  final TextEditingController nameCtrl;
  final Function onTap;

  const Step5({super.key, required this.onTap, required this.nameCtrl});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'noInfo'.tr;
                  }
                  if (!val.isValidName) {
                    return 'validName'.tr;
                  }
                  return null;
                },
                inputType: TextInputType.name,
                question: 'nameQuestion'.tr,
                text: 'name'.tr,
                controller: nameCtrl),
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
