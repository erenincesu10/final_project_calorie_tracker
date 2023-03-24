import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DinnerCard extends StatefulWidget {
  const DinnerCard({super.key});

  @override
  State<DinnerCard> createState() => _DinnerCardState();
}

class _DinnerCardState extends State<DinnerCard> {
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
                  "assets/images/dinner.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                const Text(
                  "Dinner",
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
                const SizedBox(
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
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff009980),
                            Color.fromARGB(255, 37, 75, 68),
                          ],
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            "+ Add Dinner",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            print("object");
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
