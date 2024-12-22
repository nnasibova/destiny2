import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/utils/hub_utils.dart';
import 'package:n9/infrastructure/controller/hub_controller.dart';
import 'package:n9/infrastructure/model/hub_model.dart';
import 'package:n9/infrastructure/services/image_upload_service.dart';
import 'package:n9/ui/global/loading_widget.dart';
import 'package:n9/ui/global/short_button.dart';
import 'package:n9/ui/screens/hub_screen/feed_details_screen.dart';
import 'package:n9/ui/screens/hub_screen/widgets/feed_widget.dart';
import 'package:n9/ui/screens/hub_screen/widgets/text_field_widget.dart';

class HubScreen extends StatefulWidget {
  const HubScreen({super.key});

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  EdgeInsets padding = const EdgeInsets.only(left: 16.0, top: 32, right: 16);
  File? image;
  final ImagePicker picker = ImagePicker();
  EdgeInsets margin = const EdgeInsets.only(left: 16.0, bottom: 16, right: 16);
  final postCtrl = TextEditingController();
  String? downloadUrl;
  final formKey = GlobalKey<FormState>();

  HubController ctrl = Get.put(HubController());

  @override
  Widget build(BuildContext context) {
    return feedWidget();
  }

  SafeArea feedWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            decoration: AppStyles.backgroundImage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWriteWidget(),
                buildShareWidget(),
                StreamBuilder<List<HubModel>>(
                    stream: ctrl.hubStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final hubModel = snapshot.data;

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          hubModel.sort((a, b) => b.date!.compareTo(a.date!));
                          return InkWell(
                            onTap: () {
                              Get.to(() => FeedDetailsScreen(
                                    data: hubModel[index],
                                  ));
                            },
                            child: FeedWidget(
                              text: hubModel[index].content!,
                              image: hubModel[index].image ?? '',
                              commentLength:
                                  hubModel[index].comments?.length.toString() ??
                                      '',
                              onTap: () {
                                // openCommentSheet(
                                //   hubModel[index].comments!.isNotEmpty,
                                //   hubModel[index].comments!.length,
                                //   hubModel[index],
                                // );
                              },
                            ),
                          );
                        },
                        itemCount: hubModel!.length,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildWriteWidget() {
    return Padding(
      padding: padding,
      child: TextFieldWidget(
        validator: (val) {
          if (val!.isEmpty) {
            return 'noInfo'.tr;
          } else if (val.length < HubUtils.maxLengthPost) {
            return ' ${(HubUtils.maxLengthPost - postCtrl.text.length)} ${'length'.tr}';
          }
          return null;
        },
        text: 'askQuestion'.tr,
        controller: postCtrl,
        suffixIcon: FontAwesomeIcons.solidPenToSquare,
      ),
    );
  }

  buildShareWidget() {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: AppStyles.hubDecoration,
      child: Column(
        children: [
          image != null
              ? Container(
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundColor,
                      image: DecorationImage(
                          image: FileImage(
                            File(image!.path),
                          ),
                          fit: BoxFit.cover)),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        final pickedImg =
                            await picker.pickImage(source: ImageSource.gallery);
                        final pickedImagefile = File(pickedImg!.path);

                        setState(() {
                          image = pickedImagefile;
                        });
                      },
                      icon: const Icon(
                        FontAwesomeIcons.image,
                        color: AppColors.helpColor,
                      )),
                ],
              ),
              ShortButtonWidget(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    showModal(context);
                  }
                },
                text: 'Paylaş',
              )
            ],
          ),
        ],
      ),
    );
  }

  submit() async {
    if (image != null) {
      final url = await UploadImageService().uploadImage(image!, image!.path);
      setState(() {
        downloadUrl = url;
      });
    }
    ctrl.sharePost(content: postCtrl.text, image: downloadUrl).then((value) {
      //  ctrl.fetchHub();
      postCtrl.clear();
    });
    setState(() {
      image = null;
    });
  }

  void showModal(
    context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
            size: 30,
          ),
          title: Text('rules'.tr),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  HubUtils.boldRule,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(HubUtils.rules)
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'Geri',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ShortButtonWidget(
                text: 'Oxudum',
                onTap: () async {
                  await submit();
                })
          ],
        );
      },
    );
  }
}
