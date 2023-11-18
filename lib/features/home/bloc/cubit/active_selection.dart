import 'package:bloc/bloc.dart';

class ActiveSelectionCubit extends Cubit<int> {
  ActiveSelectionCubit() : super(1);

  void updateSelection(int indec) {
    emit(indec);
  }
}
