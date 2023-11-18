import 'package:bloc/bloc.dart';

import '../../../../repositores/recipe/models/enums/intolerances.dart';

class IntolerancesSelectionCubit extends Cubit<List<Intolerances>> {
  IntolerancesSelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addFoodGroup(Intolerances intolerances) {
    final currentList = List.of(state);
    if (!currentList.contains(intolerances)) {
      currentList.add(intolerances);
    } else {
      currentList.remove(intolerances);
    }
    emit(currentList);
  }
}
