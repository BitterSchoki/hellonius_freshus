import 'package:equatable/equatable.dart';
import 'package:hellonius_freshus/repositores/recipe/models/ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enums/unit.dart';

part 'recipe_component.g.dart';

@JsonSerializable()
class RecipeComponent extends Equatable {
  const RecipeComponent(
    this.ingredient,
    this.amount,
    this.unit,
    this.wasReplaced,
    this.isRemoved,
    this.oldIngredient,
  );

  final Ingredient ingredient;
  final double amount;
  final Unit unit;
  @JsonKey(name: "was_replaced")
  final bool wasReplaced;
  @JsonKey(name: "is_removed")
  final bool? isRemoved;
  @JsonKey(name: "old_ingredient")
  final Ingredient? oldIngredient;

  factory RecipeComponent.fromJson(Map<String, dynamic> json) => _$RecipeComponentFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeComponentToJson(this);

  @override
  List<Object?> get props => [
        ingredient,
        amount,
        unit,
        wasReplaced,
      ];
}
