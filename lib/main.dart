import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:n9/helpers/constants/app_theme.dart';
import 'package:n9/infrastructure/services/push_notification_service.dart';
import 'package:n9/ui/screens/main_screen.dart';
import 'package:n9/ui/screens/onboarding/onboarding_screen.dart';
import 'helpers/languages/app_language.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> _handlerNotification(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_handlerNotification);

  await GetStorage.init();
  timeago.setLocaleMessages('az_short', timeago.AzShortMessages());
  PushNotificationService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage('User');
    Locale lang = box.read('lang') == 'en'
        ? const Locale('en', 'US')
        : box.read('lang') == 'ru'
            ? const Locale('ru', 'RU')
            : const Locale('az', 'AZ');
    final FirebaseAuth auth = FirebaseAuth.instance;

    return GetMaterialApp(
        translations: AppLanguage(),
        locale: lang,
        debugShowCheckedModeBanner: false,
        title: 'N9 Horoscope',
        theme: AppTheme.theme,
        home: auth.currentUser?.uid == null
            ? const OnboardingScreen()
            : const MainScreen());
  }
}
