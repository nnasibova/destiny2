import 'package:flutter/material.dart';
import 'package:n9/helpers/constants/app_colors.dart';

// ignore: must_be_immutable
class ProgressAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function onBack;
  final PageController pageController;
  final int totalPages;
  int currentPage;

  ProgressAppBar(
      {super.key,
      required this.pageController,
      required this.totalPages,
      required this.currentPage,
      required this.onBack});

  @override
  ProgressAppBarState createState() => ProgressAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProgressAppBarState extends State<ProgressAppBar> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      widget.currentPage = widget.pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppBar(
        leading: BackButton(
          onPressed: () {
            widget.onBack();
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < widget.totalPages; i++)
            Expanded(
              child: Container(
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                  color: i <= widget.currentPage
                      ? AppColors.blue
                      : Colors.grey.shade700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }
}
