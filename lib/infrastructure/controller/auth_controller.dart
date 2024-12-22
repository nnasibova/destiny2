import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:n9/infrastructure/model/user_model.dart';
import 'package:n9/ui/screens/main_screen.dart';

import '../../helpers/ui/ui_helpers.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  RxBool isLoginLoading = false.obs;
  GetStorage box = GetStorage('User');
  var currentPage = 0.obs;
  var dateOfBirth = DateTime(1800,0,0,0);
  var timeOfBirth = DateTime(1800,0,0,0);
  Future<void> signInAnonymously(String name, DateTime dateOfBirth,
      String timeOfBirth, String location) async {
    UiHelper().isLoading();
    try {
      //isLoginLoading = true.obs;

      final userCredential = await _auth.signInAnonymously();
      final user = userCredential.user;

      await _storeUserData(
          user!.uid,
          UserModel.fromDateOfBirth(
            name,
            dateOfBirth,
            timeOfBirth,
            location,
          ));
      UiHelper().hideLoading();
      box.write('name', name);

      Get.offAll(() => const MainScreen());
    } catch (e) {
      UiHelper().hideLoading();

      debugPrint('Error signing in anonymously: $e');
    } finally {}
  }

  Future<void> _storeUserData(String userId, UserModel user) async {
    try {
      await firestore.collection('users').doc(userId).set({
        'name': user.name,
        'dateOfBirth': user.dateOfBirth,
        'timeOfBirth': user.timeOfBirth,
        'location': user.location,
        'signZodiac': user.signZodiac,
        'image': user.imageUrl,
        'dateOfRegister':DateTime.now()
      });

      box.write('lang', 'az');
    } catch (e) {
      debugPrint('Error storing user data: $e');
    }
  }
}
