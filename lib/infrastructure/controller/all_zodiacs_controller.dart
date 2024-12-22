import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/infrastructure/model/user_sign_zodiac_model.dart';
import 'package:n9/infrastructure/model/user_model.dart';

class AllZignZodiacsController extends GetxController {
  UserModel? userModel;
  UserSignZodiacModel? zodiacModel;
  Rx<StateType> stateType = StateType.idle.obs;
  QuerySnapshot? querySnapshot;

  Future fetchZodiacInfo() async {
    stateType.value = StateType.loading;

    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('zodiacs')
          .doc('az')
          .collection('info')
          .get();

      stateType.value = StateType.completed;

      return querySnapshot;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }
}
