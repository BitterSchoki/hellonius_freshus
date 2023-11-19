import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/special_allergies.dart';

class SpecialAllergiesCubit extends Cubit<List<SpecialAllergies>> {
  SpecialAllergiesCubit() : super([]);

  void resetSelection() {
    emit([]);
  }

  void addFoodPref(SpecialAllergies specialAllergies) {
    final currentList = List.of(state);
    if (!currentList.contains(specialAllergies)) {
      currentList.add(specialAllergies);
    } else {
      currentList.remove(specialAllergies);
    }
    emit(currentList);
  }
}
