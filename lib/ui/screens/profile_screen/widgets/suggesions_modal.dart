import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_contacts.dart';

import 'package:url_launcher/url_launcher.dart';

showSuggestionsModal(context) {
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 7,
          ),
          Container(
            width: 60,
            height: 6,
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'suggestions'.tr,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(AppContacts.openEmail);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/icons/gmail.svg',
                alignment: Alignment.centerLeft,
                height: 60,
                width: 60,
              ),
              title: Text(
                AppContacts.email,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          
        ],
      ),
    ),
    backgroundColor: AppColors.backgroundColor,
  );
}
