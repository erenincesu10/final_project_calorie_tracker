import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:flutter/material.dart';

class FoodViewModel extends ChangeNotifier {
  Services services = Services();
  Food? _food;
  double _totalCalorie = 0;
  double _lunchCalorie = 0;
  double _dinnerCalorie = 0;
    double _breakfastCalorie = 0;
  List? foods;


    setBreakfastCalorie(double totalCalorie){
      _breakfastCalorie = totalCalorie;
    _totalCalorie += totalCalorie;
    notifyListeners();
  }

      setDinnerCalorie(double totalCalorie){
        _dinnerCalorie = totalCalorie;
    _totalCalorie += totalCalorie;
    notifyListeners();
  }

      setLunchCalorie(double totalCalorie){
    _lunchCalorie = totalCalorie;
    _totalCalorie += totalCalorie;
    notifyListeners();
  }


  Future setFoodList(String endpoint) async {
    _food = await services.getFood(endpoint);
    notifyListeners();
  }

  Future setFoods(String id,meal) async{
    foods = await services.getDailyFood(id, meal);
    notifyListeners();
  }

  double? get getTotalCalorie => _totalCalorie;

    double? get getLunchCalorie => _lunchCalorie;
      double? get getDinnerCalorie => _dinnerCalorie;
        double? get getBreakfastCalorie => _breakfastCalorie;

  List? get getFoodList => foods;

  Food? get getFood => _food;
}
