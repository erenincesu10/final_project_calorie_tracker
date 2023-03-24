import 'dart:developer';

import 'package:calorie_tracker/models/sign_operations.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view/HomePage/home_page.dart';
import 'package:calorie_tracker/view/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  Services services = Services();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Register",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Lottie.asset('assets/lottie/yemekanimasyon.json',
                width: 300, height: 200),
            SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email Giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Parola Giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  child: TextFormField(
                    controller: _passwordController2,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Parolayı yeniden giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  SignOperations infos = SignOperations(
                      email: _emailController.text,
                      password: _passwordController.text,
                      returnToken: true);
                  services.create(infos);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green[800], shape: StadiumBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Do you have an account? Sign in",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
