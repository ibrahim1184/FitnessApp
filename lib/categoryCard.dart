// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryCard {
  String name;
  String image;
  Color boxColor;
  CategoryCard({
    required this.name,
    required this.image,
    required this.boxColor,
  });

  static List<CategoryCard> getCategories() {
    List<CategoryCard> categories = [];
    categories.add(
      CategoryCard(
        name: "Salad",
        image: "assets/images/salad.svg",
        boxColor: Color(0xff61E2BC),
      ),
    );
    categories.add(
      CategoryCard(
        name: "Cake",
        image: "assets/images/cake.svg",
        boxColor: Color(0xffC58BF2),
      ),
    );
    categories.add(
      CategoryCard(
        name: "Pie",
        image: "assets/images/pie.svg",
        boxColor: Color(0xff61E2BC),
      ),
    );
    categories.add(
      CategoryCard(
        name: "Smoothie",
        image: "assets/images/smoothie.svg",
        boxColor: Color(0xffC58BF2),
      ),
    );
    return categories;
  }
}
