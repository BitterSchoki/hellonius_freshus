import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enums/diet_goal.dart';
import 'enums/dietary.dart';
import 'enums/intolerances.dart';

part 'recipe_filters.g.dart';

@JsonSerializable()
class RecipeFilters extends Equatable {
  const RecipeFilters({
    required this.keyword,
    required this.foodGroups,
    required this.dietGoals,
    required this.dietary,
    required this.deadly,
    required this.avoid,
  });

  final String keyword;
  @JsonKey(name: "food_groups")
  final List<Intolerances> foodGroups;
  @JsonKey(name: "diet_goals")
  final List<DietGoal> dietGoals;
  @JsonKey(name: "special_diets")
  final List<Dietary> dietary;
  final List<int> deadly;
  final List<int> avoid;

  factory RecipeFilters.fromJson(Map<String, dynamic> json) => _$RecipeFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeFiltersToJson(this);

  @override
  List<Object?> get props => [
        keyword,
        foodGroups,
        dietGoals,
        Dietary,
        deadly,
        avoid,
      ];
}
