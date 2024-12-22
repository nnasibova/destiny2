import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/ui/ui_helpers.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/infrastructure/model/hub_model.dart';

class HubController extends GetxController {
  List<HubModel>? hubModel;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Rx<StateType> stateType = StateType.idle.obs;
  RxString docId = ''.obs;
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

  Future<void> sharePost({
    required String content,
    String? image,
  }) async {
    UiHelper().isLoading();
    try {
      await _storePostData(HubModel(
          content: content,
          posted: true,
          image: image,
          date: DateTime.now().toString(),
          comments: [],
          docId: docId.value));
      UiHelper().hideLoading();

    } catch (e) {
      UiHelper().hideLoading();

      debugPrint('Error sharing post $e');
    } finally {
      UiHelper().hideLoading();

    }
  }

  Future<void> _storePostData(HubModel hub) async {
    try {
      final hubCollection = firestore.collection('hub');

      final newDocRef = await hubCollection.add({
        'content': hub.content,
        'image': hub.image,
        'posted': true,
        'date': hub.date,
        'comments': hub.comments,
        'userId': _auth.currentUser!.uid
      });
      docId.value = newDocRef.id;
      await hubCollection.doc(docId.value).update({'docId': docId.value});
    } catch (e) {
      debugPrint('Error storing user data: $e');
    }
  }

  Stream<List<HubModel>> hubStream() {
    return firestore.collection('hub').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => HubModel.fromMap(doc.data()))
          .toList();
    });
  }
}
