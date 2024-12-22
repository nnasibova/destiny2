import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/infrastructure/controller/all_zodiacs_controller.dart';
import 'package:n9/ui/screens/sign_zodiac_screen/single_zodiac_screen.dart';
import 'package:n9/ui/screens/sign_zodiac_screen/widgets/zodiac_info_widget.dart';
import 'package:n9/ui/global/loading_widget.dart';

class ZodiacsScreen extends StatefulWidget {
  const ZodiacsScreen({super.key});

  @override
  State<ZodiacsScreen> createState() => _ZodiacsScreenState();
}

class _ZodiacsScreenState extends State<ZodiacsScreen> {
  int index = 0;
  String background = 'assets/images/background.jpg';

  AllZignZodiacsController ctrl = Get.put(AllZignZodiacsController());

  @override
  void initState() {
    ctrl.querySnapshot == null ? fetchData() : null;
    super.initState();
  }

  fetchData() {
    ctrl.fetchZodiacInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Obx(() {
          switch (ctrl.stateType.value) {
            case StateType.idle:
              return const SizedBox();
            case StateType.loading:
              return const LoadingWidget();
            case StateType.completed:
              return zodiacsScreenBody();
            case StateType.otherError:
              return const SizedBox();
          }
        }));
  }

  zodiacsScreenBody() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                background,
              ),
              fit: BoxFit.fill)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: IndexedStack(
                index: index,
                children: List<Widget>.generate(
                  ctrl.querySnapshot!.docs.length,
                  (int i) {
                    return ZodiacInfoWidget(
                      id: ctrl.querySnapshot!.docs[index].id,
                      zodiac: ctrl.querySnapshot?.docs[index]['zodiac'],
                      img: ctrl.querySnapshot?.docs[index]['image'],
                      date: ctrl.querySnapshot?.docs[index]['date'],
                    );
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: CurvedCarousel(
                itemBuilder: (context, ind) {
                  return GestureDetector(
                    onTap: () {
                      if (index == ind) {
                        Get.to(() => SingleZodiacScreen(
                              zodiac: ctrl.querySnapshot!.docs[index].id,
                            ));
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                ctrl.querySnapshot?.docs[ind]['icon'],
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                onChangeEnd: (i, automatic) {
                  setState(() {
                    index = i;
                  });
                },
                onChangeStart: (int i, bool isTrue) {
                  setState(() {
                    index = i;
                  });
                },
                automaticMoveDelay: 7000,
                moveAutomatically: true,
                itemCount: ctrl.querySnapshot!.docs.length,
                middleItemScaleRatio: 1.5,
                animationDuration: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
