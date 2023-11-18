// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeFilters _$RecipeFiltersFromJson(Map<String, dynamic> json) =>
    RecipeFilters(
      keyword: json['keyword'] as String,
      foodGroups: (json['food_groups'] as List<dynamic>)
          .map((e) => $enumDecode(_$FoodGroupEnumMap, e))
          .toList(),
      dietGoals: (json['diet_goals'] as List<dynamic>)
          .map((e) => $enumDecode(_$DietGoalEnumMap, e))
          .toList(),
      specialDiet: (json['special_diets'] as List<dynamic>)
          .map((e) => $enumDecode(_$SpecialDietEnumMap, e))
          .toList(),
      deadly: (json['deadly'] as List<dynamic>).map((e) => e as int).toList(),
      avoid: (json['avoid'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$RecipeFiltersToJson(RecipeFilters instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'food_groups':
          instance.foodGroups.map((e) => _$FoodGroupEnumMap[e]!).toList(),
      'diet_goals':
          instance.dietGoals.map((e) => _$DietGoalEnumMap[e]!).toList(),
      'special_diets':
          instance.specialDiet.map((e) => _$SpecialDietEnumMap[e]!).toList(),
      'deadly': instance.deadly,
      'avoid': instance.avoid,
    };

const _$FoodGroupEnumMap = {
  FoodGroup.lactose: 'lactose',
  FoodGroup.gluten: 'gluten',
  FoodGroup.histamines: 'histamines',
  FoodGroup.seafood: 'seafood',
};

const _$DietGoalEnumMap = {
  DietGoal.lowCarb: 'LowCarb',
  DietGoal.highCarb: 'HighCarb',
  DietGoal.highFat: 'HighFat',
  DietGoal.cleanEating: 'CleanEating',
};

const _$SpecialDietEnumMap = {
  SpecialDiet.vegan: 'vegan',
  SpecialDiet.vegetarian: 'vegetarian',
  SpecialDiet.pescetarian: 'pescetarian',
  SpecialDiet.keto: 'keto',
};
