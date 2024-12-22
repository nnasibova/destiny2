import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/model/user_model.dart';

class HomeController extends GetxController {
  UserModel? userModel;
  RxString uid = ''.obs;
  Rx<StateType> stateType = StateType.idle.obs;
  GetStorage box = GetStorage('User');
  late DocumentSnapshot<Map<String, dynamic>> docSnap;
  String timeRange = getCurrentDateRange();
  Future<void> getCurrentUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      debugPrint('User is signed in: ${user.uid}');
      uid.value = user.uid;
    } else {
      debugPrint('User is not signed in');
    }
  }

  Future<UserModel> fetchUserData() async {
    await getCurrentUser();
    stateType.value = StateType.loading;

    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid.value)
          .get();
      userModel = UserModel.fromDocumentSnapshot(documentSnapshot);

      stateType.value = StateType.completed;
      return userModel!;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }

  Future fetchHoroscope(String zodiacSign) async {
    //String lang = box.read('lang');
    stateType.value = StateType.loading;

    try {
      docSnap = await FirebaseFirestore.instance
          .collection('horoscope')
          .doc(timeRange)
          .collection(zodiacSign)
          .doc('az')
          .get();
      stateType.value = StateType.completed;
      return docSnap;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }
}
