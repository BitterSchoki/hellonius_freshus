import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/diet_goal.dart';

class DietGoalSelectionCubit extends Cubit<List<DietGoal>> {
  DietGoalSelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addDietGoal(DietGoal dietGoal) {
    final currentList = List.of(state);

    if (currentList.isEmpty) {
      currentList.add(dietGoal);
    } else if (currentList.length == 1) {
      currentList.clear();
      currentList.add(dietGoal);
    }

    emit(currentList);
  }
}
