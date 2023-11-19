import 'package:bloc/bloc.dart';

import '../../../../repositores/recipe/models/enums/dietary.dart';

class DietarySelectionCubit extends Cubit<List<Dietary>> {
  DietarySelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addSpecialDiet(Dietary dietary) {
    final currentList = List.of(state);

    if (currentList.isEmpty) {
      currentList.add(dietary);
    } else if (currentList.length == 1) {
      currentList.clear();
      currentList.add(dietary);
    }

    emit(currentList);
  }
}
