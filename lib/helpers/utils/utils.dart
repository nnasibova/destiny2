import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final hours = twoDigits(duration.inHours);
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}

formatText(String text) {
  String displayText = text.replaceAll(r'\n', '\n');
  return displayText;
}

DateTime convertDateStringToDateTime(String dateString) {
  List<String> dateComponents = dateString.split("/");

  if (dateComponents.length != 3) {
    throw Exception("Invalid date format: $dateString");
  }

  int day = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int year = int.parse(dateComponents[2]);

  return DateTime(year, month, day);
}

String convertToDayAndMonth(DateTime dateTime) {
  String formattedDate = DateFormat('d MMM').format(dateTime);
  return formattedDate;
}

String extractMonth(DateTime dateTime) {
  String formattedMonth = DateFormat('MMM').format(dateTime);
  return formattedMonth;
}

String extractDayWithOrdinal(DateTime dateTime) {
  int day = dateTime.day;
  String formattedDay = DateFormat('d').format(dateTime);
  String ordinalIndicator = getOrdinalIndicator(day);
  return formattedDay + ordinalIndicator;
}

String getOrdinalIndicator(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String formatDateToYYYYMMDD(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

String formatTimeAgo(String dateString, String locale) {
  final currentTime = DateTime.now();
  final specifiedTime = DateTime.parse(dateString);
  final timeAgoDuration = currentTime.difference(specifiedTime);
  final timeAgoDateTime = currentTime.subtract(timeAgoDuration);

  return timeago.format(timeAgoDateTime, locale: locale);
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

String getCurrentDateRange() {
  DateTime now = DateTime.now();
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

  String startDay = startOfWeek.day.toString().padLeft(2, '0');

  String endDay = endOfWeek.day.toString().padLeft(2, '0');
  String month = getMonthName(startOfWeek.month);

  return "$startDay-${endDay}_$month";
}

String getCurrentDateRangeInAzerbaijani() {
  DateTime now = DateTime.now();
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

  String startDay = startOfWeek.day.toString().padLeft(2, '0');
  String endDay = endOfWeek.day.toString().padLeft(2, '0');
  String month = getMonthNameInAzerbaijani(startOfWeek.month);

  return "$startDay $month - $endDay $month";
}

String getZodiacImage(String zodiac) {
  return 'assets/images/$zodiac.png';
}

String getZodiacMonthes(String zodiac) {
  switch (zodiac.toLowerCase()) {
    case 'aries':
      return "21.03 - 19.04";
    case 'taurus':
      return "20.04 - 20.05";
    case 'gemini':
      return "21.05 - 20.06";
    case 'cancer':
      return "21.06 - 22.07";
    case 'leo':
      return "23.07 - 22.08";
    case 'virgo':
      return "23.08 - 22.09";
    case 'libra':
      return "23.09 - 22.10";
    case 'scorpio':
      return "23.10 - 21.11";
    case 'sagittarius':
      return "22.11 - 21.12";
    case 'capricorn':
      return "22.12 - 19.01";
    case 'aquarius':
      return "20.01 - 18.02";
    case 'pisces':
      return "19.02 - 20.03";
    default:
      return "Invalid Zodiac Sign";
  }
}

String getMonthNameInAzerbaijani(int month) {
  switch (month) {
    case 1:
      return 'Yanvar';
    case 2:
      return 'Fevral';
    case 3:
      return 'Mart';
    case 4:
      return 'Aprel';
    case 5:
      return 'May';
    case 6:
      return 'İyun';
    case 7:
      return 'İyul';
    case 8:
      return 'Avqust';
    case 9:
      return 'Sentyabr';
    case 10:
      return 'Oktyabr';
    case 11:
      return 'Noyabr';
    case 12:
      return 'Dekabr';
    default:
      return '';
  }
}
