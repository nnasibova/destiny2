import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:n9/helpers/constants/app_colors.dart';

class FeedWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final String image;
  final String commentLength;
  const FeedWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.commentLength,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(15, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            text,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis, color: Colors.white),
            maxLines: 5,
          ),
        ),
        subtitle: image == ''
            ? null
            : Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.backgroundColor,
                    image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.contain)),
              ),
        trailing: Align(
          alignment: Alignment.centerRight,
          widthFactor: 0.75,
          child: TextButton.icon(
              label: Text(
                commentLength,
                style: const TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                onTap();
              },
              icon: const Icon(
                FontAwesomeIcons.comment,
                color: AppColors.helpColor,
              )),
        ),
      ),
    );
  }
}
