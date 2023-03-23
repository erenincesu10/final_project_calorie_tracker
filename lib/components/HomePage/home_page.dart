import 'dart:ffi';

import 'package:calorie_tracker/components/HomePage/breakfast_page.dart';
import 'package:calorie_tracker/components/HomePage/lunch_card.dart';
import 'package:calorie_tracker/components/SearchPage/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'dinner_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double value = 1500;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 226, 100, 50)),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Today",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 120, left: 80),
                                child: Text(
                                  "${value.toInt().toString()} %",
                                  style: TextStyle(
                                      fontSize: 45, color: Colors.white),
                                ),
                              ),
                              SleekCircularSlider(
                                initialValue: value,
                                max: 2000,
                                appearance: CircularSliderAppearance(
                                    size:
                                        MediaQuery.of(context).size.width * 0.7,
                                    //  startAngle: 100,
                                    // angleRange: 100,
                                    animationEnabled: false,
                                    spinnerMode: true,
                                    customColors: CustomSliderColors(
                                        trackColor: Colors.grey,
                                        progressBarColor: Colors.yellow),
                                    customWidths: CustomSliderWidths(
                                        handlerSize: 0,
                                        progressBarWidth: 10,
                                        trackWidth: 15)),
                                onChange: (double value) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BreakFastCard(),
                    LunchCard(),
                    DinnerCard(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
