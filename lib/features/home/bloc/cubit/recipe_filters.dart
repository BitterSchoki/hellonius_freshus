import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/diet_goal.dart';

import '../../../../repositores/recipe/models/enums/dietary.dart';
import '../../../../repositores/recipe/models/enums/intolerances.dart';
import '../../../../repositores/recipe/models/recipe_filters.dart';

class RecipeFiltersCubit extends Cubit<RecipeFilters> {
  RecipeFiltersCubit()
      : super(
          const RecipeFilters(
            keyword: "",
            avoid: [],
            deadly: [],
            dietGoals: [],
            foodGroups: [],
            dietary: [],
          ),
        );

  void addFilters({
    required List<int> avoid,
    required List<int> deadly,
    required List<DietGoal> dietGoals,
    required List<Intolerances> foodGroups,
    required List<Dietary> specialDiets,
  }) {
    final newState = RecipeFilters(
      keyword: "",
      avoid: avoid,
      deadly: deadly,
      dietGoals: dietGoals,
      foodGroups: foodGroups,
      dietary: specialDiets,
    );
    emit(newState);
  }
}
