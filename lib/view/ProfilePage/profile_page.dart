import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
                height: 140,
              ),
              Container(
                width: 400,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monitor_weight_rounded),
                          //değer girilcek
                          Text(context
                              .watch<UserViewModel>()
                              .getUser
                              .weight
                              .toString()),
                          SizedBox(
                            width: 100,
                          ),
                          Icon(Icons.account_circle_rounded),
                          //deper girilcek
                          Text(context
                              .watch<UserViewModel>()
                              .getUser
                              .height
                              .toString()),
                          SizedBox(
                            width: 100,
                          ),
                          Icon(Icons.ac_unit),
                          //değer girilcek
                          Text(context
                              .watch<UserViewModel>()
                              .getUser
                              .age
                              .toString())
                        ],
                      ),
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
                    SizedBox(
                      height: 20,
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
                        progressColor: Colors.yellow,
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
        color: Color.fromARGB(255, 255, 139, 93),
        animationDuration: Duration(microseconds: 200),
        onTap: (i) {
          setState(() {
            _index = i;
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
