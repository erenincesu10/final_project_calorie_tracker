import 'package:calorie_tracker/view/HomePage/home_page.dart';
import 'package:calorie_tracker/view/ProfilePage/profile_page.dart';
import 'package:calorie_tracker/view/SearchPage/search_page.dart';
import 'package:calorie_tracker/view/SplashScreen/splash_screen.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/LoginPage/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FoodViewModel()),
    ChangeNotifierProvider(create: (_) => UserViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
