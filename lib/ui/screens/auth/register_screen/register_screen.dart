import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';
import 'package:n9/infrastructure/controller/auth_controller.dart';
import 'package:n9/ui/screens/auth/components/progress_app_bar.dart';
import 'package:n9/ui/screens/auth/register_screen/steps/step1.dart';
import 'package:n9/ui/screens/auth/register_screen/steps/step2.dart';
import 'package:n9/ui/screens/auth/register_screen/steps/step3.dart';
import 'package:n9/ui/screens/auth/register_screen/steps/step4.dart';
import 'package:n9/ui/screens/auth/register_screen/steps/step5.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final int _totalPages = 5;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    AuthController ctrl = Get.put(AuthController());
    final nameController = TextEditingController();
    final locationController = TextEditingController();

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: ProgressAppBar(
            pageController: _pageController,
            totalPages: _totalPages,
            currentPage: ctrl.currentPage.value,
            onBack: () {
              onNavigateBack(context, ctrl);
            }),
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: () async {
            onNavigateBack(context, ctrl);
            return true;
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Step1(
                onTap: () {
                  onNavigate(ctrl);
                },
              ),
              Step2(
                onTap: () {
                  onNavigate(ctrl);
                },
              ),
              Step3(
                locationController: locationController,
                onTap: () {
                  onNavigate(ctrl);
                },
              ),
              Step4(
                onTap: () {
                  onNavigate(ctrl);
                },
              ),
              Step5(
                nameCtrl: nameController,
                onTap: () {
                  onNavigate(ctrl);
                  if (ctrl.currentPage.value == 4) {
                    AuthController().signInAnonymously(
                        nameController.text,
                        ctrl.dateOfBirth,
                        ctrl.timeOfBirth.toString(),
                        locationController.text);
                  }
                },
              )
            ],
          ),
        ));
  }

  void onNavigate(AuthController ctrl) {
    if (ctrl.currentPage.value < _totalPages - 1) {
      navigateToPage(ctrl.currentPage.value + 1, ctrl);
    }
  }

  void onNavigateBack(BuildContext context, AuthController ctrl) {
    if (ctrl.currentPage.value > 0) {
      navigateToPage(ctrl.currentPage.value - 1, ctrl);
    } else {
      Navigator.pop(context);
    }
  }

  void navigateToPage(int pageIndex, AuthController ctrl) {
    ctrl.currentPage.value = pageIndex;
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
