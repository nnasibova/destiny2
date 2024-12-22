import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/hub_details_controller.dart';
import 'package:n9/infrastructure/model/hub_model.dart';
import 'package:n9/ui/screens/hub_screen/widgets/comments_list_widget.dart';
import 'package:n9/ui/screens/hub_screen/widgets/text_field_widget.dart';

openCommentSheet(bool emptyList, int length, HubModel data) {
  final commentCtrl = TextEditingController();
  HubDetailsController ctrl = Get.put(HubDetailsController());

  return Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 60),
                child: Column(
                  children: [
                    emptyList
                        ? Text(
                            '${'comments'.tr}  ($length)',
                            style: const TextStyle(color: Colors.grey),
                          )
                        : Center(
                            child: Text(
                            'noComment'.tr,
                            style: const TextStyle(color: Colors.white54),
                          )),
                    emptyList
                        ? StreamBuilder<List<Map<String, dynamic>>>(
                            stream: ctrl.commentsStream(data.docId!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Map<String, dynamic>>? comments =
                                    snapshot.data;
                                return ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, i) {
                                    return CommentsListWidget(
                                        name: comments![i]['name'],
                                        comment: comments[i]['comment'],
                                        date: formatTimeAgo(
                                            comments[i]['date'], 'az_short'));
                                  },
                                  itemCount: length,
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const SizedBox();
                              }
                            })
                        : Container(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: TextFieldWidget(
                  text: 'writeComment'.tr,
                  controller: commentCtrl,
                  suffixIcon: FontAwesomeIcons.telegram,
                  onTap: () {
                    ctrl.writeComment(
                        id: data.docId!, comment: commentCtrl.text);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor);
}
