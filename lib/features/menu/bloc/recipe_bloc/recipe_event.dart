import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable {}

class RecipeFetchStarted extends RecipeEvent {
  @override
  List<Object?> get props => [];
}
