import 'package:bloc/bloc.dart';

import '../../../../repositores/recipe/models/enums/food_group.dart';

class FoodGroupSelectionCubit extends Cubit<List<FoodGroup>> {
  FoodGroupSelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addFoodGroup(FoodGroup foodGroup) {
    final currentList = List.of(state);
    currentList.add(foodGroup);

    emit(currentList);
  }
}
