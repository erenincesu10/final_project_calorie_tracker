// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  String? id;
  String name;
  String lastName;
  int age;
  double? total_calorie;
  double? total_fat_g;
  double? total_protein_g;
  double? carbohydrates_total_g;
  List dailyEats;
  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.age,
    this.total_calorie,
    this.total_fat_g,
    this.total_protein_g,
    this.carbohydrates_total_g,
    required this.dailyEats,
  });

  User copyWith({
    String? id,
    String? name,
    String? lastName,
    int? age,
    double? total_calorie,
    double? total_fat_g,
    double? total_protein_g,
    double? carbohydrates_total_g,
    List? dailyEats,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      total_calorie: total_calorie ?? this.total_calorie,
      total_fat_g: total_fat_g ?? this.total_fat_g,
      total_protein_g: total_protein_g ?? this.total_protein_g,
      carbohydrates_total_g:
          carbohydrates_total_g ?? this.carbohydrates_total_g,
      dailyEats: dailyEats ?? this.dailyEats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'age': age,
      'total_calorie': total_calorie,
      'total_fat_g': total_fat_g,
      'total_protein_g': total_protein_g,
      'carbohydrates_total_g': carbohydrates_total_g,
      'dailyEats': dailyEats,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      total_calorie:
          map['total_calorie'] != null ? map['total_calorie'] as double : null,
      total_fat_g:
          map['total_fat_g'] != null ? map['total_fat_g'] as double : null,
      total_protein_g: map['total_protein_g'] != null
          ? map['total_protein_g'] as double
          : null,
      carbohydrates_total_g: map['carbohydrates_total_g'] != null
          ? map['carbohydrates_total_g'] as double
          : null,
      dailyEats: List.from((map['dailyEats'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastName: $lastName, age: $age, total_calorie: $total_calorie, total_fat_g: $total_fat_g, total_protein_g: $total_protein_g, carbohydrates_total_g: $carbohydrates_total_g, dailyEats: $dailyEats)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.lastName == lastName &&
        other.age == age &&
        other.total_calorie == total_calorie &&
        other.total_fat_g == total_fat_g &&
        other.total_protein_g == total_protein_g &&
        other.carbohydrates_total_g == carbohydrates_total_g &&
        listEquals(other.dailyEats, dailyEats);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        lastName.hashCode ^
        age.hashCode ^
        total_calorie.hashCode ^
        total_fat_g.hashCode ^
        total_protein_g.hashCode ^
        carbohydrates_total_g.hashCode ^
        dailyEats.hashCode;
  }
}
