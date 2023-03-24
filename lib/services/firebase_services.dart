import 'dart:convert';

import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/models/sign_operations.dart';
import 'package:calorie_tracker/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Services {
  String dateTime =
      "${DateTime.now().day}_${DateTime.now().month}_${DateTime.now().year}";

  Uri getFoodUrl(String localId, date, branch) => Uri.parse(
      "https://final-project-f8ca2-default-rtdb.europe-west1.firebasedatabase.app/users/$localId/$dateTime/$branch.json");

  Uri getUrl(String endpoint) =>
      Uri.parse("https://api.calorieninjas.com/v1/nutrition?query=$endpoint");
  Food? food;

  Uri getSignUpUrl() => Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCbnBGI2r23G-i5EXTAtTpVfvLTzGjIhw0");

  Uri getSignInUrl() => Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCbnBGI2r23G-i5EXTAtTpVfvLTzGjIhw0");

  Uri postUserUrl(String endpoint) => Uri.parse(
      "https://final-project-f8ca2-default-rtdb.europe-west1.firebasedatabase.app/users/$endpoint.json");

  Future<String?> addFood(Food food, String localId, branch) async {
    http.Response response = await http.post(
      getFoodUrl(localId, dateTime, branch),
      body: food.toJson(),
      headers: {"Content-type": "application/json"},
    );
    print(getFoodUrl(localId, dateTime, branch));
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = jsonDecode(response.body);
      food.id = data["name"];
      return food.id;
    } else {
      return null;
    }
  }

  Future getDailyFood(String localId, branch) async {
    http.Response response = await http.get(
      getFoodUrl(localId, dateTime, branch),
      headers: {"Content-type": "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = jsonDecode(response.body);
      var map = data[ValueKey];
      print(map);
      return data;
    } else {
      return null;
    }
  }

  Future<List<Food?>> getFood(String endpoint) async {
    http.Response response = await http.get(
      getUrl(endpoint),
      headers: {'X-Api-Key': 'rzI75oamqZSr679+L1/mlQ==T7ErsIp7bZfkKNUY'},
    );

    List<Food> foods = [];

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      List map = data["items"];
      if (map.length == 0) {
        foods = [];
      } else {
        food = Food(
            name: map[0]["name"],
            calories: map[0]["calories"],
            serving_size_g: map[0]["serving_size_g"],
            fat_total_g: map[0]["fat_total_g"],
            protein_g: map[0]["protein_g"],
            carbohydrates_total_g: map[0]["carbohydrates_total_g"]);
        foods.add(food!);
      }
    }

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   var data = jsonDecode(response.body);
    //   food = Food(
    //       name: data["items"][0]["name"],
    //       calories: data["items"][0]["calories"],
    //       serving_size_g: data["items"][0]["serving_size_g"],
    //       fat_total_g: data["items"][0]["fat_total_g"],
    //       protein_g: data["items"][0]["protein_g"],
    //       carbohydrates_total_g: data["items"][0]["carbohydrates_total_g"]);
    //   print(food);
    //   return food;
    // } else {
    //   return null;
    // }
    return foods;
  }

  Future create(SignOperations signOperations) async {
    http.Response response = await http.post(getSignUpUrl(),
        headers: {"Content-type": "application/json"},
        body: signOperations.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }

  Future<String?> signIn(SignOperations signOperations) async {
    http.Response response = await http.post(getSignInUrl(),
        headers: {"Content-type": "application/json"},
        body: signOperations.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = jsonDecode(response.body);
      print(data["localId"]);
      return data["localId"];
    } else {
      return null;
    }
  }

  Future<bool?> signInBoolean(SignOperations signOperations) async {
    http.Response response = await http.post(getSignInUrl(),
        headers: {"Content-type": "application/json"},
        body: signOperations.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = jsonDecode(response.body);
      print(data["registered"]);
      return data["registered"];
    } else {
      return null;
    }
  }

  Future<String?> signInTakeId(SignOperations signOperations) async {
    http.Response response = await http.post(getSignInUrl(),
        headers: {"Content-type": "application/json"},
        body: signOperations.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = jsonDecode(response.body);
      print(data["localId"]);
      return data["localId"];
    } else {
      return null;
    }
  }

  Future<User?> postUser(User user, String endpoint) async {
    http.Response response = await http.put(postUserUrl(endpoint),
        body: user.toJson(), headers: {'Content-Type': "application/json"});
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = response.body;
      print(jsonDecode(data));
      return user;
    } else {
      return null;
    }
  }

  Future<User?> getUser(String endpoint) async {
    http.Response response = await http.get(postUserUrl(endpoint),
        headers: {'Content-Type': "application/json"});

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = response.body;
      print(jsonDecode(data));
      return User.fromJson(data);
    } else {
      return null;
    }
  }
}
