import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pageapp/categoryCard.dart';
import 'package:pageapp/dietCard.dart';

class breakfastPage extends StatefulWidget {
  breakfastPage({super.key});

  @override
  State<breakfastPage> createState() => _appPageState();
}

class _appPageState extends State<breakfastPage> {
  List<CategoryCard> categories = [];

  List<DietCard> dietCards = [];

  void getCategories() {
    categories = CategoryCard.getCategories();
  }

  void getDietCards() {
    dietCards = DietCard.getDietCards();
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getDietCards();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(isTitle: true),
      body: ListView(
        children: [
          searchBar(),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              categoryCard(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Recommendation\n for Diet",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              dietCard(),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            height: 115,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff1D1617)
                                          .withOpacity(0.07),
                                      offset: const Offset(0, 10),
                                      blurRadius: 40,
                                      spreadRadius: 0.0)
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: popularCard(index),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: dietCards.length)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row popularCard(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          dietCards[index].image,
          width: 50,
          height: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dietCards[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${dietCards[index].difficulty} | ${dietCards[index].time} | ${dietCards[index].calories}",
              style: const TextStyle(
                  color: Color(0xff7B6F72),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SvgPicture.asset("assets/icons/arrow_button.svg"),
      ],
    );
  }

  SizedBox dietCard() {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: 210,
              decoration: BoxDecoration(
                  color: dietCards[index].color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(dietCards[index].image),
                    Text(dietCards[index].name,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      "${dietCards[index].difficulty} | ${dietCards[index].time} | ${dietCards[index].calories}",
                      style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                          color: dietCards[index].color,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
        itemCount: dietCards.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Container categoryCard() {
    return Container(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: categories[index].boxColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(categories[index].image),
                  ),
                ),
                Text(
                  categories[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }
}

Container searchBar() {
  return Container(
    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0)
    ]),
    child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search Pancake",
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                height: 20,
                width: 20,
              ),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        "assets/icons/filter.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none))),
  );
}

AppBar appBar(
    {bool isTitle = true, Color backgroundColor = Colors.transparent}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: isTitle
        ? const Text("Breakfast",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))
        : null,
    leading: Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)),
      child: SvgPicture.asset(
        "assets/icons/back_arrow.svg",
        height: 20,
        width: 20,
      ),
    ),
    actions: [
      Container(
        width: 37,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          "assets/icons/dots.svg",
          height: 15,
          width: 15,
        ),
      )
    ],
  );
}

// Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 20),
//                     child: Text("Recommendaion\n for Diet",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.red,
//                       ),
//                       height: 240,
//                       width: 200,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SvgPicture.asset("assets/images/pancake.svg"),
//                           Text("Honey Pancake"),
//                           Text("Easy | 30mins | 180kCal"),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
