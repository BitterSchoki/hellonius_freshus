import 'package:equatable/equatable.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/food_group.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enums/diet_goal.dart';
import 'enums/dietary.dart';

part 'recipe_filters.g.dart';

@JsonSerializable()
class RecipeFilters extends Equatable {
  const RecipeFilters({
    required this.keyword,
    required this.foodGroups,
    required this.dietGoals,
    required this.specialDiet,
    required this.deadly,
    required this.avoid,
  });

  final String keyword;
  @JsonKey(name: "food_groups")
  final List<FoodGroup> foodGroups;
  @JsonKey(name: "diet_goals")
  final List<DietGoal> dietGoals;
  @JsonKey(name: "special_diets")
  final List<SpecialDiet> specialDiet;
  final List<int> deadly;
  final List<int> avoid;

  factory RecipeFilters.fromJson(Map<String, dynamic> json) => _$RecipeFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeFiltersToJson(this);

  @override
  List<Object?> get props => [
        keyword,
        foodGroups,
        dietGoals,
        specialDiet,
        deadly,
        avoid,
      ];
}
