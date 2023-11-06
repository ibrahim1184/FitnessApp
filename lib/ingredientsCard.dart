// ignore_for_file: public_member_api_docs, sort_constructors_first

class IngredientsCard {
  String imagePath;
  String name;
  String measurement;
  IngredientsCard({
    required this.imagePath,
    required this.name,
    required this.measurement,
  });

  static List<IngredientsCard> getIngredientsCard() {
    List<IngredientsCard> ingredients = [];
    ingredients.add(
      IngredientsCard(
          imagePath: "assets/images/flour.svg",
          name: "Wheat Flour",
          measurement: "100gr"),
    );

    ingredients.add(
      IngredientsCard(
          imagePath: "assets/images/sugar.svg",
          name: "Sugar",
          measurement: "3 tbsp"),
    );

    ingredients.add(
      IngredientsCard(
          imagePath: "assets/images/baking_soda.svg",
          name: "Baking Soda",
          measurement: "2 tsp"),
    );

    ingredients.add(
      IngredientsCard(
          imagePath: "assets/images/eggs.svg",
          name: "Eggs",
          measurement: "2 items"),
    );
    return ingredients;
  }
}
