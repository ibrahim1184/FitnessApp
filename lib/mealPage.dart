import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pageapp/ingredientsCard.dart';
import 'package:pageapp/appPage.dart';
import 'package:readmore/readmore.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<IngredientsCard> ingredients = [];
  int activeStep = 0;
  @override
  void initState() {
    super.initState();
    ingredients = IngredientsCard.getIngredientsCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 100,
            pinned: false,
            //scrolledUnderElevation: 100,

            backgroundColor: Colors.purple.shade300.withOpacity(0.9),
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                children: [
                  appBar(isTitle: false, backgroundColor: Colors.transparent),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: SvgPicture.asset(
                      "assets/images/Vector.svg",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
                height: 2000,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 60,
                            height: 5,
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        productTopStage(),
                        const SizedBox(height: 20),
                        const Text(
                          "Nutrition",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              nutritionCard("assets/icons/fire.svg", "180kCal"),
                              nutritionCard(
                                  "assets/icons/fats.svg", "30g fats"),
                              nutritionCard(
                                  "assets/icons/protein.svg", "20kCal"),
                              nutritionCard(
                                  "assets/icons/carb.svg", "40g carbs"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Descriptions",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20),
                        descriptions(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Ingredients That You \nWill Need",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text("${ingredients.length} items"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ingredientsCard(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Step by Step",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text("${ingredients.length} items"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        EasyStepper(
                          fitWidth: true,
                          alignment: Alignment.topLeft,
                          activeStepBackgroundColor: Colors.white,
                          enableStepTapping: true,
                          direction: Axis.vertical,
                          activeStep: activeStep,
                          onStepReached: (index) =>
                              setState(() => activeStep = index),
                          steps: [
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: activeStep >= 0
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                              title: 'Waiting',
                              topTitle: true,
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: activeStep >= 1
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                              title: 'Order Received',
                              topTitle: true,
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: activeStep >= 2
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                              title: 'Preparing',
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: activeStep >= 3
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                              title: 'On Way',
                              topTitle: true,
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: activeStep >= 4
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                              title: 'Delivered',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ])),
        ],
      ),
    );
  }

  Widget ingredientsCard() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ingredients
                .map((e) => Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              e.imagePath,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(e.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        Text(
                          e.measurement,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ))
                .toList()),
      ),
    );
  }

  Padding descriptions() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ReadMoreText(
        "A pancake (or hotcake, griddlecake, or flapjack) is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter. It is a type of batter bread. Archaeological evidence suggests that pancakes were probably eaten in prehistoric societies.",
        trimLines: 3,
        trimMode: TrimMode.Line,
        style: TextStyle(color: Colors.grey.shade700),
        colorClickableText: const Color(0xff00FF66),
        trimCollapsedText: "Read more",
        trimExpandedText: "Show Less",
      ),
    );
  }

  Padding nutritionCard(String iconPath, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: const Color(0xff00FF66).withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Row productTopStage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Blueberry Pancakes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "by ", style: TextStyle(color: Colors.grey.shade400)),
              const TextSpan(
                  text: "İbrahim Uğur",
                  style: TextStyle(color: Color(0xff00FF66)))
            ], style: const TextStyle(fontSize: 16))),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SvgPicture.asset(
          "assets/icons/heart.svg",
          width: 20,
          height: 20,
        ),
      ),
    ],
  );
}
