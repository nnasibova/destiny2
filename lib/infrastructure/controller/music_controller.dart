import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/helpers/utils/utils.dart';

class MusicController extends GetxController {
  final audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;
  String timeRange = getCurrentDateRange();
  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<StateType> stateType = StateType.idle.obs;
  late DocumentSnapshot<Map<String, dynamic>> docSnap;
  String musicLink = '';

  Future fetchMusic(String zodiacSign) async {
    //String lang = box.read('lang');

    stateType.value = StateType.loading;

    try {
      docSnap = await FirebaseFirestore.instance
          .collection('meditation')
          .doc(timeRange)
          .collection(zodiacSign)
          .doc('az')
          .get();
      musicLink = docSnap['music'];
      stateType.value = StateType.completed;
      return docSnap;
    } catch (e) {
      debugPrint(e.toString());
      stateType.value = StateType.otherError;
      return Future.error(e);
    }
  }

  void setMusic() {
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duration.value = newDuration;
    });

    audioPlayer.onPositionChanged.listen((newPosiition) {
      position.value = newPosiition;
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String url = musicLink;
    audioPlayer.setSourceUrl(url);
  }
}
