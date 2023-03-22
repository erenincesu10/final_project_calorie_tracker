import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 147, 14),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
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
              SleekCircularSlider(
                initialValue: 20,
                max: 100,
                appearance: CircularSliderAppearance(
                    size: MediaQuery.of(context).size.width * 0.7,
                    infoProperties: InfoProperties(),
                    customWidths: CustomSliderWidths()),
                onChange: (value) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
