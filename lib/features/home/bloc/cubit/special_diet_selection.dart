import 'package:bloc/bloc.dart';

import '../../../../repositores/recipe/models/enums/dietary.dart';

class DietarySelectionCubit extends Cubit<List<Dietary>> {
  DietarySelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addSpecialDiet(Dietary dietary) {
    final currentList = List.of(state);

    if (!currentList.contains(dietary)) {
      currentList.add(dietary);
    } else {
      currentList.remove(dietary);
    }

    emit(currentList);
  }
}
