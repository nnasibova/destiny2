import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/sign_zodiac_controller.dart';
import 'package:n9/infrastructure/model/zodiac_tabs.dart';
import 'package:n9/ui/screens/sign_zodiac_screen/widgets/description_widget.dart';
import 'package:n9/ui/global/loading_widget.dart';

class SingleZodiacScreen extends StatefulWidget {
  final String zodiac;
  const SingleZodiacScreen({
    Key? key,
    required this.zodiac,
  }) : super(key: key);

  @override
  State<SingleZodiacScreen> createState() => _SingleZodiacScreenState();
}

class _SingleZodiacScreenState extends State<SingleZodiacScreen> {
  SignZodiacController ctrl = Get.put(SignZodiacController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    ctrl.fetchZodiacInfo(widget.zodiac);
  }

  TabModelInfo tabModelInfo = TabModelInfo();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        backgroundColor: AppColors.backgroundColor,
        body: Obx(() {
          switch (ctrl.stateType.value) {
            case StateType.idle:
              return const SizedBox();
            case StateType.loading:
              return const LoadingWidget();
            case StateType.completed:
              return signZodiacScreenBody();
            case StateType.otherError:
              return const SizedBox();
          }
        }));
  }

  

  signZodiacScreenBody() {
    return SafeArea(
      child: Container(
        decoration: AppStyles.backgroundImage,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ctrl.zodiacModel!.zodiac,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ctrl.zodiacModel!.date,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Image.network(
                    ctrl.zodiacModel!.image,
                    height: 300,
                    width: 300,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tabModelInfo.tabModelInfoList.length,
                        itemBuilder: (cxt, i) {
                          ZodiacTab data = tabModelInfo.tabModelInfoList[i];
                          return Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = i;
                                  });
                                  (data.nameOfTab);
                                },
                                child: index == i
                                    ? Text(
                                        data.nameOfTab!,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          shadows: [
                                            Shadow(
                                                color: Color.fromARGB(
                                                    255, 176, 220, 255),
                                                offset: Offset(0, -5))
                                          ],
                                          color: Colors.transparent,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                          decorationThickness: 4,
                                        ),
                                      )
                                    : Text(data.nameOfTab!,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          color: Colors.grey,
                                        ))),
                          );
                        }),
                  ),
                  IndexedStack(
                    index: index,
                    children: <Widget>[
                      SizedBox(
                          child: DescriptionWidget(
                            element: ctrl.zodiacModel!.element,
                            rulingPlanet: ctrl.zodiacModel!.rulingPlanet,
                            compatibility: ctrl.zodiacModel!.compatibility,
                            tarotCard: ctrl.zodiacModel!.tarotCard,
                            description:
                                formatText(ctrl.zodiacModel!.description),
                          )),
                      buildWidget(context, ctrl.zodiacModel!.love),
                      buildWidget(context, ctrl.zodiacModel!.character),
                      buildWidget(context, ctrl.zodiacModel!.health),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildWidget(context, String text) {
    return Text(
      formatText(text),
      style: const TextStyle(color: Colors.white, fontSize: 15),
    );
  }
}
