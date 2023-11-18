import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/diet_goal.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/food_group.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/special_diet.dart';

import '../../../../repositores/recipe/models/recipe_filters.dart';

class RecipeFiltersCubit extends Cubit<RecipeFilters> {
  RecipeFiltersCubit()
      : super(
          RecipeFilters(
            keyword: "",
            avoid: [],
            deadly: [],
            dietGoals: [],
            foodGroups: [],
            specialDiet: [],
          ),
        );

  void addFilters({
    required List<int> avoid,
    required List<int> deadly,
    required List<DietGoal> dietGoals,
    required List<FoodGroup> foodGroups,
    required List<SpecialDiet> specialDiets,
  }) {
    emit(
      RecipeFilters(
        keyword: "",
        avoid: [],
        deadly: [],
        dietGoals: [],
        foodGroups: [],
        specialDiet: [],
      ),
    );
  }
}