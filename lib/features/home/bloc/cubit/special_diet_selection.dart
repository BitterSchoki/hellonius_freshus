import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/special_diet.dart';

class SpecialDietSelectionCubit extends Cubit<List<SpecialDiet>> {
  SpecialDietSelectionCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addSpecialDiet(SpecialDiet specialDiet) {
    final currentList = List.of(state);
    currentList.add(specialDiet);

    emit(currentList);
  }
}
