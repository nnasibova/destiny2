import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/ui/ui_helpers.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/profile_controller.dart';
import 'package:n9/ui/global/loading_widget.dart';
import 'package:n9/ui/screens/home_screen/widgets/title_widget.dart';
import 'package:n9/ui/screens/profile_screen/privacy_policy.dart';
import 'package:n9/ui/screens/profile_screen/widgets/social_media_modal.dart';
import 'package:n9/ui/screens/profile_screen/widgets/suggesions_modal.dart';
import 'package:n9/ui/screens/profile_screen/widgets/profile_tile.dart';

import '../../../helpers/utils/enums.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController ctrl = Get.put(ProfileController());

  @override
  void initState() {
    ctrl.userModel == null ? fetchData() : null;
    super.initState();
  }

  fetchData() {
    ctrl.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (ctrl.stateType.value) {
        case StateType.idle:
          return const SizedBox();
        case StateType.loading:
          return const LoadingWidget();
        case StateType.completed:
          return profileBody();
        case StateType.otherError:
          return const SizedBox();
      }
    });
  }

  profileBody() {
    return Container(
      decoration: AppStyles.backgroundImage,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: AppColors.mainColor),
              child: TitleWidget(
                image: ctrl.userModel!.imageUrl,
                info: convertToDayAndMonth(ctrl.userModel!.dateOfBirth),
                name: ctrl.userModel!.name,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: AppColors.mainColor),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ProfileTile(
                    onTap: () {
                      showSuggestionsModal(context);
                    },
                    icon: FontAwesomeIcons.lightbulb,
                    text: 'suggestions'.tr,
                  ),
                    divider(),
                  ProfileTile(
                    onTap: () {
                    showSocialMediaModal(context);
                    },
                    icon: FontAwesomeIcons.hashtag,
                    text: 'socialMedia'.tr,
                  ),
                  divider(),
                  ProfileTile(
                    onTap: () {
                      Get.to(() => const PrivacyPolicy());
                    },
                    icon: FontAwesomeIcons.lock,
                    text: 'privacyPolicy'.tr,
                  ),

                  divider(),
                  ProfileTile(
                    onTap: () {
                      UiHelper.showModalExit(context, onTapYes: () {
                        ctrl.signOut();
                      });
                    },
                    icon: Icons.exit_to_app,
                    color: Colors.red,
                    text: 'quit'.tr,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return const Divider(
      color: AppColors.helpColor,
      thickness: 0.9,
    );
  }
}
