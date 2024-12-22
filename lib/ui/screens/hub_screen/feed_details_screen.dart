import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/helpers/constants/app_styles.dart';
import 'package:n9/helpers/utils/enums.dart';
import 'package:n9/helpers/utils/utils.dart';
import 'package:n9/infrastructure/controller/hub_details_controller.dart';
import 'package:n9/infrastructure/model/hub_model.dart';
import 'package:n9/ui/global/loading_widget.dart';
import 'package:n9/ui/screens/hub_screen/widgets/comments_list_widget.dart';
import 'package:n9/ui/screens/hub_screen/widgets/text_field_widget.dart';

class FeedDetailsScreen extends StatefulWidget {
  final HubModel data;

  const FeedDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  State<FeedDetailsScreen> createState() => _FeedDetailsScreenState();
}

class _FeedDetailsScreenState extends State<FeedDetailsScreen> {
  HubDetailsController ctrl = Get.put(HubDetailsController());
  final commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ctrl.fetchHub();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: Obx(() {
        switch (ctrl.stateType.value) {
          case StateType.idle:
            return const SizedBox();
          case StateType.loading:
            return const LoadingWidget();
          case StateType.completed:
            return StreamBuilder<List<Map<String, dynamic>>>(
              stream: ctrl.commentsStream(widget.data.docId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>>? comments = snapshot.data;
                  return feedBody(comments!);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const LoadingWidget();
                }
              },
            );
          case StateType.otherError:
            return const SizedBox();
        }
      }),
    );
  }

  feedBody(List<Map<String, dynamic>> comments) {
    return Form(
      key: formKey,
      child: Container(
        decoration: AppStyles.backgroundImage,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 60),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(15, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.data.content!,
                          style: const TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      widget.data.image == '' || widget.data.image == null
                          ? Container()
                          : Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Colors.transparent,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        widget.data.image!,
                                      ),
                                      fit: BoxFit.contain)),
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                      comments.isNotEmpty
                          ? Text(
                              '${'comments'.tr}  (${comments.length.toString()})',
                              style: const TextStyle(color: Colors.grey),
                            )
                          : Center(
                              child: Text(
                              'noComment'.tr,
                              style: const TextStyle(color: Colors.white54),
                            )),
                      comments.isNotEmpty
                          ? ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                comments.sort(
                                    (a, b) => b['date'].compareTo(a['date']));
                                return CommentsListWidget(
                                    name: comments[i]['name'] ?? '',
                                    comment: comments[i]['comment'] ?? '',
                                    date: formatTimeAgo(
                                        comments[i]['date'], 'az_short')
                                    .toString());
                              },
                              itemCount: comments.length,
                            )
                          : Container(),
                      const SizedBox(height: 10),
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
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'noInfo'.tr;
                      }
                      return null;
                    },
                    text: 'writeComment'.tr,
                    controller: commentController,
                    suffixIcon: FontAwesomeIcons.telegram,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ctrl
                            .writeComment(
                                id: widget.data.docId!,
                                comment: commentController.text)
                            .then((value) => commentController.clear());
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
