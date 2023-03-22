import 'package:calorie_tracker/components/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Lottie.asset('assets/lottie/yemekanimasyon.json',
              width: 300, height: 200),
          SizedBox(
            height: 120,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 35),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Email Giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 35),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: "#",
                  decoration: InputDecoration(
                      hintText: "Parola Giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.05,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green[800], shape: StadiumBorder()),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 150,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Don't have an account? SignUp",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
