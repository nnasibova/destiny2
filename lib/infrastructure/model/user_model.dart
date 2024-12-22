import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final DateTime dateOfBirth;
  final String timeOfBirth;
  final String location;
  String signZodiac;
  String imageUrl;

  UserModel({
    required this.name,
    required this.dateOfBirth,
    required this.timeOfBirth,
    required this.signZodiac,
    required this.location,
    required this.imageUrl,
  });

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    final Timestamp dateOfBirthTimestamp =
        data['dateOfBirth']; // Use the correct field name
    final DateTime dateOfBirth =
        dateOfBirthTimestamp.toDate(); // Convert Timestamp to DateTime

    return UserModel(
      name: data['name'],
      dateOfBirth: dateOfBirth,
      timeOfBirth: data['timeOfBirth'],
      signZodiac: data['signZodiac'],
      location: data['location'],
      imageUrl: data['image'],
    );
  }

  factory UserModel.fromDateOfBirth(
      String name, DateTime dateOfBirth, String timeOfBirth, String location) {
    final ZodiacInfo zodiacInfo = calculateZodiacSign(dateOfBirth);

    return UserModel(
      name: name,
      dateOfBirth: dateOfBirth,
      timeOfBirth: timeOfBirth,
      signZodiac: zodiacInfo.sign,
      location: location,
      imageUrl: zodiacInfo.imageUrl,
    );
  }

  static ZodiacInfo calculateZodiacSign(DateTime dateOfBirth) {
    final int month = dateOfBirth.month;
    final int day = dateOfBirth.day;

    final Map<String, String> zodiacImages = {
      'aries':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Faries.jpg?alt=media&token=1ae0f006-22fc-40a7-a218-c22010927b09',
      'taurus':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Ftaurus.jpg?alt=media&token=92d42ce7-12c8-4fb8-b4c5-d1e3a9f22804',
      'gemini':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fgemini.jpg?alt=media&token=2a201c87-7769-4bbe-8ab6-6524bc6c478a',
      'aquarius':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Faquarius.jpg?alt=media&token=970aba02-762a-4486-87d8-3e6260f0c015',
      'cancer':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fcancer.jpg?alt=media&token=e8bcec1c-4f48-478e-b5d4-81d5fe63b615',
      'capricorn':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fcapricorn.jpg?alt=media&token=0365244a-4cc6-421c-b6eb-6a4e23ead6d9',
      'leo':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fleo.jpg?alt=media&token=dadf468e-7410-43f6-b1f2-1bfc78aa5811',
      'libra':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Flibra.jpg?alt=media&token=c35f5a78-99d6-45be-aff0-4229e41969f5',
      'pisces':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fpisces.jpg?alt=media&token=7602d6b7-228a-41d9-8109-4d395c7e14b1',
      'sagittarius':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fsagittarius.jpg?alt=media&token=c77af85c-010f-40e6-ae59-e42cff3098a8',
      'scorpio':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fscorpio.jpg?alt=media&token=babe0aaa-814c-47d6-a791-2bf0318b5f36',
      'virgo':
          'https://firebasestorage.googleapis.com/v0/b/n9-destinyhub.appspot.com/o/avatar%2Fvirgo.jpg?alt=media&token=74082077-46c0-4508-815f-9efd80bb97f6'
    };

    String sign = '';
    String imageUrl = '';

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      sign = 'aries';
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      sign = 'taurus';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      sign = 'gemini';
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      sign = 'cancer';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      sign = 'leo';
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      sign = 'virgo';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      sign = 'libra';
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      sign = 'scorpio';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      sign = 'sagittarius';
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      sign = 'capricorn';
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      sign = 'aquarius';
    } else {
      sign = 'pisces';
    }

    imageUrl = zodiacImages[sign] ?? '';

    return ZodiacInfo(sign: sign, imageUrl: imageUrl);
  }
}

class ZodiacInfo {
  final String sign;
  final String imageUrl;

  ZodiacInfo({required this.sign, required this.imageUrl});
}
