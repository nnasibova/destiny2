import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/ui/screens/home_screen/home_screen.dart';
import 'package:n9/ui/screens/hub_screen/hub_screen.dart';
import 'package:n9/ui/screens/profile_screen/profile_screen.dart';
import 'package:n9/ui/screens/sign_zodiac_screen/all_zodiacs_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool inVisible = false;
  List pages = [
    const HomeScreen(),
    const HubScreen(),
    const ZodiacsScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          // ignore: deprecated_member_use
          Icon(FontAwesomeIcons.home, color: AppColors.helpColor),
          // ignore: deprecated_member_use
          Icon(FontAwesomeIcons.hubspot, color: AppColors.helpColor),
          Icon(FontAwesomeIcons.galacticRepublic, color: AppColors.helpColor),
          Icon(FontAwesomeIcons.user, color: AppColors.helpColor),
        ],
        color: const Color.fromARGB(255, 17, 19, 22),
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.black,
        
        animationCurve: Curves.easeOutCirc,
        animationDuration: const Duration(milliseconds: 600),
        onTap: onTap,
        letIndexChange: (index) => true,
      ),
      body: pages[currentIndex],
    );
  }
}
