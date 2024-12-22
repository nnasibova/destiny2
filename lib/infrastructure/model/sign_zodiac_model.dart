
class SignZodiacModel {
  final String? image;
  final String? signZodiac;
  final String? birthDate;

  SignZodiacModel(
      {required this.image, required this.signZodiac, required this.birthDate});

  static List<SignZodiacModel> zodiacs = [
    SignZodiacModel(
        image: 'assets/images/aries.png',
        signZodiac: 'aries',
        birthDate: 'Mar 21 - Apr 19'),
     SignZodiacModel(
        image: 'assets/images/taurus.png',
        signZodiac: 'taurus',
        birthDate: 'Apr 20 - May 20'),
     SignZodiacModel(
        image: 'assets/images/gemini.png',
        signZodiac: 'gemini',
        birthDate: 'May 21 - Iyun 20'),
     SignZodiacModel(
        image: 'assets/images/cancer.png',
        signZodiac: 'cancer',
        birthDate: 'Iyun 21 - Iyul 22'),
     SignZodiacModel(
        image: 'assets/images/leo.png',
        signZodiac: 'leo',
        birthDate: 'Iyul 23 - Avq 22'),
     SignZodiacModel(
        image: 'assets/images/virgo.png',
        signZodiac: 'virgo',
        birthDate: 'Avq 23 - Sen 22'),
     SignZodiacModel(
        image: 'assets/images/libra.png',
        signZodiac: 'libra',
        birthDate: 'Sen 23 - Okt 22'),
     SignZodiacModel(
        image: 'assets/images/scorpio.png',
        signZodiac: 'scorpio',
        birthDate: 'Okt 23 - Noy 21'),
     SignZodiacModel(
        image: 'assets/images/sagittarius.png',
        signZodiac: 'sagittarius',
        birthDate: 'Noy 22 - Dek 21'),
     SignZodiacModel(
        image: 'assets/images/capricorn.png',
        signZodiac: 'capricorn',
        birthDate: 'Dek 22 - Yan 19'),
     SignZodiacModel(
        image: 'assets/images/aquarius.png',
        signZodiac: 'aquarius',
        birthDate: 'Yan 20 - Fev 18'),
     SignZodiacModel(
        image: 'assets/images/pisces.png',
        signZodiac: 'pisces',
        birthDate: 'Fev 19 - Mar 20'),
  ];
}
