import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String image;
  final String name;
  final String info;
  const TitleWidget({
    required this.image,
    required this.name,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
          child: CircleAvatar(
            radius: 23,
              backgroundColor: Colors.black, child: Image.network(image))),
      title: Text(
        name.toString(),
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        info.toString(),
        style: const TextStyle(color: Colors.white54),
      ),

    );
  }
}
