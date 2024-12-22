import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:n9/helpers/ui/ui_helpers.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/infrastructure/model/hub_model.dart';

class HubDetailsController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  GetStorage box = GetStorage('User');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<HubModel>? hubModel;

  Rx<StateType> stateType = StateType.idle.obs;

  Future<void> writeComment(
      {required String id, required String comment}) async {
    UiHelper().isLoading();
    try {
      await _storeUserData(id, comment);
      UiHelper().hideLoading();
    } catch (e) {
      UiHelper().hideLoading();

      debugPrint('Error signing in anonymously: $e');
    } finally {}
  }

  Future<void> _storeUserData(String id, String comment) async {
  try {
    final hubDocument = firestore.collection('hub').doc(id);
    
    // Fetch the current 'comments' array
    final hubData = await hubDocument.get();
    List<Map<String, dynamic>> currentComments = List<Map<String, dynamic>>.from(hubData.get('comments') ?? []);

    // Add the new comment to the 'comments' array
    currentComments.add({
      'comment': comment,
      'name': box.read('name'),
      'date': DateTime.now().toString(),
      'userUid': _auth.currentUser!.uid,
    });

    // Update the document with the updated 'comments' array
    await hubDocument.update({'comments': currentComments});
  } catch (e) {
    debugPrint('Error storing user data: $e');
  }
}


  Future fetchHub() async {
    stateType.value = StateType.loading;

    try {
      final documentSnapshot =
          await FirebaseFirestore.instance.collection('hub').get();
      if (documentSnapshot.docs.isNotEmpty) {
        hubModel = documentSnapshot.docs
            .map((doc) => HubModel.fromMap(doc.data()))
            .toList();
        stateType.value = StateType.completed;
      } else {
        stateType.value = StateType.completed;
      }
      return hubModel;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }


   Stream<List<Map<String, dynamic>>> commentsStream(String id) {
    final hubDocument = firestore.collection('hub').doc(id);

    return hubDocument.snapshots().map((hubData) {
      final comments = List<Map<String, dynamic>>.from(hubData.get('comments') ?? []);
      return comments;
    });
  }
}


