import 'package:flutter/material.dart';
import 'package:n9/helpers/modals/select_zodiac_modal.dart';

class ModalHelpers {
  static void showZodiacSelecter(BuildContext context,) {
    showModalBottomSheet(
        context: context,
        elevation: 10,
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const SelectZodiacCompatibility());
  }
}
