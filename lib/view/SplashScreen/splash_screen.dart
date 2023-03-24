import 'package:calorie_tracker/view/LoginPage/login_page.dart';
import 'package:calorie_tracker/view/SearchPage/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../HomePage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/images/splashscreenkcal.jpeg"),
              width: 200,
              height: 200,
            ),
            SizedBox(
              width: 100,
              height: 100,
            ),
            SpinKitChasingDots(
              color: Colors.orange,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
