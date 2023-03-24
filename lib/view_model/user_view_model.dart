import 'dart:developer';

import 'package:calorie_tracker/models/user_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  String _currentUserId = "";
  User? _user;
  void setCurrentUserId(String currentUserId) {
    _currentUserId = currentUserId;
    notifyListeners();
  }

  String? get getCurrentUserId => _currentUserId;

  Services services = Services();
  Future<User?> setUser() async {
    _user = await services.getUser(_currentUserId);
    notifyListeners();
  }

  User get getUser => _user!;
}
