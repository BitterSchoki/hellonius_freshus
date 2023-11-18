import 'package:equatable/equatable.dart';
import 'package:hellonius_freshus/repositores/recipe/models/recipe_filters.dart';

abstract class RecipeEvent extends Equatable {}

class RecipeFetchStarted extends RecipeEvent {
  RecipeFetchStarted({
    required this.recipeFilters,
  });

  final RecipeFilters recipeFilters;

  @override
  List<Object?> get props => [recipeFilters];
}
