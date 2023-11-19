import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/food_pref.dart';

class FoodPrefSelectionCubit extends Cubit<List<FoodPref>> {
  FoodPrefSelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addFoodPref(FoodPref foodPref) {
    final currentList = List.of(state);
    if (!currentList.contains(foodPref)) {
      currentList.add(foodPref);
    } else {
      currentList.remove(foodPref);
    }
    emit(currentList);
  }
}
