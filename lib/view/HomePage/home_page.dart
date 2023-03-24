import 'dart:ffi';
import 'package:page_transition/page_transition.dart';
import 'package:calorie_tracker/components/HomePage/breakfast_page.dart';
import 'package:calorie_tracker/components/HomePage/dinner_card.dart';
import 'package:calorie_tracker/components/HomePage/lunch_card.dart';
import 'package:calorie_tracker/view/ProfilePage/profile_page.dart';
import 'package:calorie_tracker/view/SearchPage/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    double value = 1500;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 245, 228, 1),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.58,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              color: Color.fromRGBO(35, 125, 60, 0.612),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchPage()));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            )),
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Today",
                        style: TextStyle(
                            fontFamily: "Lato",
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 20.0,
                          animation: true,
                          percent: 0.7,
                          center: Text(
                            "${value.toInt().toString()} Kalori",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: Color.fromARGB(255, 246, 246, 246)),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color.fromARGB(255, 240, 239, 224),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                BreakFastCard(),
                LunchCard(),
                DinnerCard(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(248, 245, 228, 1),
        index: 0,
        color: Color.fromARGB(255, 226, 100, 50),
        animationDuration: Duration(microseconds: 200),
        onTap: (i) {
          setState(() {
            _index = i;
            if (_index == 0) {
              return;
            } else
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilPage()));
          });
        },
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
