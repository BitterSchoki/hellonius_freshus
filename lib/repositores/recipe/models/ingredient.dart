import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient extends Equatable {
  const Ingredient(
    this.title,
    this.description,
    this.id,
  );

  final String title;
  final String description;
  final int id;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Object?> get props => [
        title,
        description,
        id,
      ];
}
