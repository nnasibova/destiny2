import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:n9/helpers/constants/app_colors.dart';

class UiHelper {
  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void isLoading() {
    hideKeyboard();

    Get.dialog(
        // ignore: deprecated_member_use
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.all(0),
            child: Container(
                //color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const SpinKitDualRing(
                  color: Colors.white,
                  duration: Duration(milliseconds: 700),
                  lineWidth: 3,
                  size: 50.0,
                )),
          ),
        ),
        barrierDismissible: false);
  }

  void hideLoading() {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.back();
  }

  static showModalExit(context, {required Function() onTapYes}) {
    WidgetStatePropertyAll<OutlinedBorder?> shape =
        WidgetStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
    EdgeInsets textPadding = const EdgeInsets.symmetric(vertical: 12.0);

    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 6,
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Şəxsi hesabdan çıxış etməyə əmisiniz?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                      style: ButtonStyle(
                        shape: shape,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: textPadding,
                        child: const Text('Ləğv et',
                            style: TextStyle(color: Colors.white)),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                      onTapYes();
                    },
                    style: ButtonStyle(
                        shape: shape,
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.red)),
                    child: Padding(
                      padding: textPadding,
                      child: const Text(
                        'Hesabdan çıxış',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }



  showNotification({String? title, String? body, required Function(GetSnackBar) onTap}) {
  Get.snackbar(
    '',
    '',
    titleText: Text(
      title ?? '',
      style:  const TextStyle(fontSize: 16, color:  AppColors.helpColor, fontWeight: FontWeight.w500),
    ),
    messageText: Text(
      body ?? '',
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.helpColor
      ),
    ),
    onTap: onTap,
    barBlur: 16,
    icon: const Icon(Icons.error_outline_outlined, color: Colors.red,),
    backgroundColor: AppColors.mainColor,
    duration: const Duration(seconds: 10),
    animationDuration: const Duration(seconds: 1),
  );
}
}