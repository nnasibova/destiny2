import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/infrastructure/model/user_sign_zodiac_model.dart';
import 'package:n9/infrastructure/model/user_model.dart';

class SignZodiacController extends GetxController {
  UserModel? userModel;
  UserSignZodiacModel? zodiacModel;
  RxString uid = ''.obs;
  Rx<StateType> stateType = StateType.idle.obs;
  GetStorage box = GetStorage('User');
 


  Future fetchZodiacInfo(String zodiacSign) async {
    stateType.value = StateType.loading;

    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('zodiacs')
          .doc('az')
          .collection('info')
          .doc(zodiacSign)
          .get();
      zodiacModel = UserSignZodiacModel.fromDocumentSnapshot(documentSnapshot);

      stateType.value = StateType.completed;
      return zodiacModel;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }
}
