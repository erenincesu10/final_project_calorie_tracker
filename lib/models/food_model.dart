// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Food {
  String? id;
  String name;
  double calories;
  double serving_size_g;
  double fat_total_g;
  double protein_g;
  double carbohydrates_total_g;
  Food({
    this.id,
    required this.name,
    required this.calories,
    required this.serving_size_g,
    required this.fat_total_g,
    required this.protein_g,
    required this.carbohydrates_total_g,
  });

  Food copyWith({
    String? id,
    String? name,
    double? calories,
    double? serving_size_g,
    double? fat_total_g,
    double? protein_g,
    double? carbohydrates_total_g,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      serving_size_g: serving_size_g ?? this.serving_size_g,
      fat_total_g: fat_total_g ?? this.fat_total_g,
      protein_g: protein_g ?? this.protein_g,
      carbohydrates_total_g:
          carbohydrates_total_g ?? this.carbohydrates_total_g,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'calories': calories,
      'serving_size_g': serving_size_g,
      'fat_total_g': fat_total_g,
      'protein_g': protein_g,
      'carbohydrates_total_g': carbohydrates_total_g,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      calories: map['calories'] as double,
      serving_size_g: map['serving_size_g'] as double,
      fat_total_g: map['fat_total_g'] as double,
      protein_g: map['protein_g'] as double,
      carbohydrates_total_g: map['carbohydrates_total_g'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(id: $id, name: $name, calories: $calories, serving_size_g: $serving_size_g, fat_total_g: $fat_total_g, protein_g: $protein_g, carbohydrates_total_g: $carbohydrates_total_g)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.calories == calories &&
        other.serving_size_g == serving_size_g &&
        other.fat_total_g == fat_total_g &&
        other.protein_g == protein_g &&
        other.carbohydrates_total_g == carbohydrates_total_g;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        calories.hashCode ^
        serving_size_g.hashCode ^
        fat_total_g.hashCode ^
        protein_g.hashCode ^
        carbohydrates_total_g.hashCode;
  }
}
