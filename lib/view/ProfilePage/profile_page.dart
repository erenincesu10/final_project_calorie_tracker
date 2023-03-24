import 'package:calorie_tracker/view/HomePage/home_page.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  double value = 20;
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 10,
      //       ),
      //       CircleAvatar(
      //         radius: 100,
      //         backgroundImage: NetworkImage("https://picsum.photos/200/300"),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 60.0),
      //         child: Text(
      //           "Hoşgeldiniz Umut Kaan Kartaloğlu",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       SizedBox(
      //         width: 400,
      //         height: 150,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(left: 5.0),
      //               child: Row(
      //                 children: [
      //                   Icon(Icons.monitor_weight_rounded),
      //                   //değer girilcek
      //                   Text("120 kg"),
      //                   SizedBox(
      //                     width: 100,
      //                   ),
      //                   Icon(Icons.account_circle_rounded),
      //                   //deper girilcek
      //                   Text("180 cm"),
      //                   SizedBox(
      //                     width: 100,
      //                   ),
      //                   Icon(Icons.ac_unit),
      //                   //değer girilcek
      //                   Text("23")
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         width: 400,
      //         height: 200,
      //         decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Colors.black,
      //             ),
      //             borderRadius: BorderRadius.circular(30),
      //             color: Colors.white),
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(top: 30.0),
      //               child: Text(
      //                 "Today",
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 20),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             Center(
      //               child: CircularPercentIndicator(
      //                 radius: 50.0,
      //                 lineWidth: 13.0,
      //                 animation: true,
      //                 percent: 0.5,
      //                 center: Text(
      //                   "${value.toInt().toString()} Kalori",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 10.0),
      //                 ),
      //                 circularStrokeCap: CircularStrokeCap.round,
      //                 progressColor: Colors.yellow,
      //               ),
      //             ),

      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hoş geldin ${context.watch<UserViewModel>().getUser.name} ${context.watch<UserViewModel>().getUser.lastName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    context.watch<UserViewModel>().getUser.gender == "Erkek"
                        ? Icon(
                            Icons.male,
                            color: Colors.blue,
                          )
                        : Icon(Icons.female, color: Colors.pink)
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Weight"),
                            SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              width: 100.0,
                              lineHeight: 8.0,
                              percent: 0.2,
                              progressColor: Color.fromRGBO(35, 125, 60, 0.612),
                            ),
                          ],
                        ),
                        // Icon(Icons.monitor_weight_rounded),
                        // //değer girilcek
                        // Text(context
                        //     .watch<UserViewModel>()
                        //     .getUser
                        //     .weight
                        //     .toString()),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text("Height"),
                            SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              width: 100.0,
                              lineHeight: 8.0,
                              percent: context
                                      .watch<UserViewModel>()
                                      .getUser
                                      .height! /
                                  1000.toDouble(),
                              progressColor: Color.fromRGBO(35, 125, 60, 0.612),
                            ),
                          ],
                        ),
                        // Icon(Icons.account_circle_rounded),
                        // //deper girilcek
                        // Text(context
                        //     .watch<UserViewModel>()
                        //     .getUser
                        //     .height
                        //     .toString()),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text("Age"),
                            SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              width: 100.0,
                              lineHeight: 8.0,
                              percent: 0.2,
                              progressColor: Color.fromRGBO(35, 125, 60, 0.612),
                            ),
                          ],
                        ),
                        // Icon(Icons.ac_unit),
                        // //değer girilcek
                        // Text(context
                        //     .watch<UserViewModel>()
                        //     .getUser
                        //     .age
                        //     .toString())
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        context
                            .watch<UserViewModel>()
                            .getUser
                            .daily_calorie!
                            .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 1,
                        center: Text(
                          "Kalori",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Color.fromARGB(255, 240, 239, 224),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(248, 245, 228, 1),
        index: _index,
        color: Color.fromRGBO(35, 125, 60, 0.612),
        animationDuration: Duration(microseconds: 200),
        onTap: (i) {
          setState(() {
            _index = i;
            if (_index == 1) {
              return;
            } else
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
