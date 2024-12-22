import 'package:cloud_firestore/cloud_firestore.dart';

class UserSignZodiacModel {
  final String date;
  final String description;
  final String compatibility;
  final String character;
  final String element;
  final String health;
  final String love;
  final String rulingPlanet;
  final String tarotCard;
  final String zodiac;
  final String image;
  final String icon;

  UserSignZodiacModel({
    required this.icon,
    required this.image,
    required this.date,
    required this.description,
    required this.compatibility,
    required this.character,
    required this.element,
    required this.health,
    required this.love,
    required this.rulingPlanet,
    required this.tarotCard,
    required this.zodiac,
  });

  factory UserSignZodiacModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserSignZodiacModel(
      image: data['image'],
      icon: data['icon'],
      date: data['date'],
      description: data['description'],
      compatibility: data['compatibility'],
      character: data['character'],
      element: data['element'],
      health: data['health'],
      love: data['love'],
      rulingPlanet: data['rulingPlanet'],
      tarotCard: data['tarotCard'],
      zodiac: data['zodiac'],
    );
  }
}
