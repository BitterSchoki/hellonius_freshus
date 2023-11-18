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
    );

Map<String, dynamic> _$RecipeComponentToJson(RecipeComponent instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'amount': instance.amount,
      'unit': _$UnitEnumMap[instance.unit]!,
    };

const _$UnitEnumMap = {
  Unit.grams: 'Grams',
  Unit.pieces: 'Pieces',
  Unit.milliliters: 'Milliliters',
};
