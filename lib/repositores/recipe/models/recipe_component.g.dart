// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeComponent _$RecipeComponentFromJson(Map<String, dynamic> json) =>
    RecipeComponent(
      Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      (json['amount'] as num).toDouble(),
      $enumDecode(_$UnitEnumMap, json['unit']),
      json['was_replaced'] as bool,
      json['is_removed'] as bool?,
      json['old_ingredient'] == null
          ? null
          : Ingredient.fromJson(json['old_ingredient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeComponentToJson(RecipeComponent instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'amount': instance.amount,
      'unit': _$UnitEnumMap[instance.unit]!,
      'was_replaced': instance.wasReplaced,
      'is_removed': instance.isRemoved,
      'old_ingredient': instance.oldIngredient,
    };

const _$UnitEnumMap = {
  Unit.grams: 'Grams',
  Unit.pieces: 'Pieces',
  Unit.milliliters: 'Milliliters',
};
