import 'package:get/get.dart';

class ZodiacTab {
  String? nameOfTab;

  ZodiacTab({this.nameOfTab});
}

class TabModelInfo {
  List tabModelInfoList = [
    ZodiacTab(
      nameOfTab: "description".tr,
    ),
    ZodiacTab(
      nameOfTab: "love".tr,
    ),
    ZodiacTab(
      nameOfTab: "character".tr,
    ),
    ZodiacTab(
      nameOfTab: "health".tr,
    ),
  ];
}
