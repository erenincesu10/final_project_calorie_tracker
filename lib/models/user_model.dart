// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  String? id;
  String name;
  String lastName;
  int age;
  int? height;
  int? weight;
  String gender;
  int? daily_calorie;
  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.age,
    this.height,
    this.weight,
    required this.gender,
    this.daily_calorie,
  });


  User copyWith({
    String? id,
    String? name,
    String? lastName,
    int? age,
    int? height,
    int? weight,
    String? gender,
    int? daily_calorie,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      daily_calorie: daily_calorie ?? this.daily_calorie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'daily_calorie': daily_calorie,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      gender: map['gender'] as String,
      daily_calorie: map['daily_calorie'] != null ? map['daily_calorie'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastName: $lastName, age: $age, height: $height, weight: $weight, gender: $gender, daily_calorie: $daily_calorie)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.lastName == lastName &&
      other.age == age &&
      other.height == height &&
      other.weight == weight &&
      other.gender == gender &&
      other.daily_calorie == daily_calorie;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      lastName.hashCode ^
      age.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      gender.hashCode ^
      daily_calorie.hashCode;
  }
}
