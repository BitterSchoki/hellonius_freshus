// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeFilters _$RecipeFiltersFromJson(Map<String, dynamic> json) =>
    RecipeFilters(
      keyword: json['keyword'] as String,
      foodGroups: (json['food_groups'] as List<dynamic>)
          .map((e) => $enumDecode(_$IntolerancesEnumMap, e))
          .toList(),
      dietGoals: (json['diet_goals'] as List<dynamic>)
          .map((e) => $enumDecode(_$DietGoalEnumMap, e))
          .toList(),
      dietary: (json['special_diets'] as List<dynamic>)
          .map((e) => $enumDecode(_$DietaryEnumMap, e))
          .toList(),
      deadly: (json['deadly'] as List<dynamic>).map((e) => e as int).toList(),
      avoid: (json['avoid'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$RecipeFiltersToJson(RecipeFilters instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'food_groups':
          instance.foodGroups.map((e) => _$IntolerancesEnumMap[e]!).toList(),
      'diet_goals':
          instance.dietGoals.map((e) => _$DietGoalEnumMap[e]!).toList(),
      'special_diets':
          instance.dietary.map((e) => _$DietaryEnumMap[e]!).toList(),
      'deadly': instance.deadly,
      'avoid': instance.avoid,
    };

const _$IntolerancesEnumMap = {
  Intolerances.lactose: 'Lactose',
  Intolerances.gluten: 'Gluten',
  Intolerances.histamines: 'Histamines',
  Intolerances.seafood: 'Seafood',
};

const _$DietGoalEnumMap = {
  DietGoal.lowCarb: 'LowCarb',
  DietGoal.highCarb: 'HighCarb',
  DietGoal.highFat: 'HighFat',
  DietGoal.cleanEating: 'CleanEating',
};

const _$DietaryEnumMap = {
  Dietary.vegetarian: 'Vegetarian',
  Dietary.vegan: 'Vegan',
  Dietary.pescetarian: 'Pescetarian',
  Dietary.paleoDiet: 'Keto',
  Dietary.forKids: 'ForKids',
};
