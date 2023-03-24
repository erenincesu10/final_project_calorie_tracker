import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/models/user_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view/SearchPage/search_page.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class BreakFastCard extends StatefulWidget {
  const BreakFastCard({super.key});

  @override
  State<BreakFastCard> createState() => _BreakFastCardState();
}

class _BreakFastCardState extends State<BreakFastCard> {
  Services services = Services();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/breakfast.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                const Text(
                  "BreakFast",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Reccommended: \n751 cals, 9net carbs",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff009980),
                            Color.fromARGB(255, 37, 75, 68),
                          ],
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text(
                            "+ Add Lunch",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            services.getDailyFood(
                                context.read<UserViewModel>().getCurrentUserId!,
                                "Kahvalti");
                            // Food? food = context.read<FoodViewModel>().getFood;
                            // print(food);
                            // print(services.getDailyFood(
                            //     context
                            //         .read<
                            //             UserViewModel>()
                            //         .getCurrentUserId!,
                            //     "Kahvalti",
                            //     food!.id!));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SearchPage()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
