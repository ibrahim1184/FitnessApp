// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';
import 'package:flutter/material.dart';

class DietCard {
  String name;
  String image;
  String difficulty;
  String time;
  String calories;
  Color color;
  bool isSelectedView;
  DietCard({
    required this.name,
    required this.image,
    required this.difficulty,
    required this.time,
    required this.calories,
    required this.color,
    required this.isSelectedView,
  });

  static List<DietCard> getDietCards() {
    List<DietCard> dietCards = [];
    dietCards.add(
      DietCard(
          name: "Honey Pancake",
          image: "assets/images/pancake.svg",
          difficulty: "Easy",
          time: "30mins",
          calories: "180kCal",
          color: Color(0xff61E2BC),
          isSelectedView: true),
    );
    dietCards.add(
      DietCard(
          name: "Canai Bread",
          image: "assets/images/bread.svg",
          difficulty: "Medium",
          time: "20mins",
          calories: "300kCal",
          color: Color(0xffC58BF2),
          isSelectedView: true),
    );
    dietCards.add(
      DietCard(
          name: "Honey Pancake",
          image: "assets/images/pancake.svg",
          difficulty: "Easy",
          time: "30mins",
          calories: "180kCal",
          color: Color(0xff61E2BC),
          isSelectedView: true),
    );
    return dietCards;
  }
}
