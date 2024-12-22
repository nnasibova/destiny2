import 'package:flutter/material.dart';
import 'package:n9/helpers/modals/select_zodiac_modal.dart';

class AppModals {
  static showCountriesOverviewModal(context) {
    showModalBottomSheet(
        showDragHandle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        isScrollControlled: true,
        context: context,
        builder: (_) => const SelectZodiacCompatibility());
  }
}
