import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_text_styles.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/music_controller.dart';
import 'package:n9/ui/global/custom_button.dart';
import 'package:n9/ui/global/loading_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MeditationScreen extends StatefulWidget {
  final String zodiacSign;
  const MeditationScreen({super.key, required this.zodiacSign});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  MusicController musicCtrl = Get.put(MusicController());
  @override
  void initState() {
    musicCtrl
        .fetchMusic(widget.zodiacSign)
        .then((value) => musicCtrl.setMusic());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const background = 'assets/images/meditation.jpg';
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () async {
              if (musicCtrl.isPlaying.value == true) {
                await musicCtrl.audioPlayer.pause();
              }
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          if (musicCtrl.duration.value.inSeconds == 0) {
            return const LoadingWidget();
          }
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      background,
                    ),
                    fit: BoxFit.fill)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Music",
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      formatTime(
                        musicCtrl.duration.value,
                      ),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      children: [
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              size: 250,
                              customWidths: CustomSliderWidths(shadowWidth: 1)),
                          innerWidget: (percentage) {
                            return Center(
                              child: Text(
                                formatTime(
                                  musicCtrl.duration.value -
                                      musicCtrl.position.value,
                                ),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            );
                          },
                          min: 0,
                          max: musicCtrl.duration.value.inSeconds.toDouble(),
                          initialValue:
                              musicCtrl.position.value.inSeconds.toDouble(),
                          onChange: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await musicCtrl.audioPlayer.seek(position);
                          },
                        ),
                        CircleAvatar(
                            radius: 35,
                            child: IconButton(
                              icon: Icon(musicCtrl.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              onPressed: () async {
                                if (musicCtrl.isPlaying.value) {
                                  await musicCtrl.audioPlayer.pause();
                                } else {
                                  await musicCtrl.audioPlayer.resume();
                                }
                              },
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            text: 'readMore'.tr,
                            onTap: () {
                              Get.bottomSheet(
                                  Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: ListView(children: [
                                        Text(
                                          musicCtrl.docSnap['info'],
                                          style: const TextStyle(
                                              letterSpacing: 1, fontSize: 16),
                                        )
                                      ])),
                                  backgroundColor: Colors.white);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
