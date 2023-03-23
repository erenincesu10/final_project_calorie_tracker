import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:flutter/material.dart';

class FoodViewModel extends ChangeNotifier {
  Services services = Services();
  List<Food?> _food = [];

  Future setFoodList(String endpoint) async {
    _food = await services.getFood(endpoint);
    notifyListeners();
  }

  List<Food?> get getList => _food;
}
