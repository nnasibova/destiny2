import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/ui/global/loading_widget.dart';

import '../../../infrastructure/controller/home_controller.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController ctrl = Get.put(HomeController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    ctrl
        .fetchUserData()
        .then((value) => ctrl.fetchHoroscope(ctrl.userModel!.signZodiac));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        switch (ctrl.stateType.value) {
          case StateType.idle:
            return const SizedBox();
          case StateType.loading:
            return const LoadingWidget();
          case StateType.completed:
            return HomeBody(
              zodiacSign: ctrl.userModel!.signZodiac,
              titleName: '${"hello".tr} ${ctrl.userModel!.name.toString()}',
              titleImage: ctrl.userModel!.imageUrl,
              titleInfo:
                  '${ctrl.userModel!.signZodiac.tr} ${convertToDayAndMonth(ctrl.userModel!.dateOfBirth)}',
              bodyHoroscope: ctrl.docSnap['horoscope'],
              bodyMeditation: 'meditationInfo'.tr,
              bodyNumber: ctrl.docSnap['number'],
            );
          case StateType.otherError:
            return const SizedBox();
        }
      }),
    );
  }
}


