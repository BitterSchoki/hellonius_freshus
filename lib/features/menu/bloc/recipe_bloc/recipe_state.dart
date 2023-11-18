import 'package:equatable/equatable.dart';

import '../../../../repositores/recipe/models/recipe.dart';

abstract class RecipeState extends Equatable {}

class RecipeInitial extends RecipeState {
  @override
  List<Object?> get props => [];
}

class RecipeLoadInProgress extends RecipeState {
  @override
  List<Object?> get props => [];
}

class RecipeLoadSuccess extends RecipeState {
  RecipeLoadSuccess({required this.recipes});

  final List<Recipe> recipes;

  @override
  List<Object?> get props => [
        recipes,
      ];
}

class RecipeLoadFailure extends RecipeState {
  @override
  List<Object?> get props => [];
}
