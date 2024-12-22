import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/ui/screens/sign_zodiac_screen/single_zodiac_screen.dart';

class ZodiacInfoWidget extends StatelessWidget {
  final String id;
  final String zodiac;
  final String img;
  final String date;
  const ZodiacInfoWidget(
      {super.key,
      required this.zodiac,
      required this.img,
      required this.date,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    zodiac,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => SingleZodiacScreen(
                              zodiac: id,
                            ));
                      },
                      icon: const Icon(
                        FontAwesomeIcons.circleInfo,
                        color: Colors.white54,
                      ))
                ],
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.network(img),
            ],
          ),
        )));
  }
}
