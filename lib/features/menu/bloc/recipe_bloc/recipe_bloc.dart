import 'package:bloc/bloc.dart';
import 'package:hellonius_freshus/repositores/recipe_repository.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository repository;

  RecipeBloc({
    required this.repository,
  }) : super(RecipeInitial());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is RecipeFetchStarted) {
      yield RecipeLoadInProgress();
      try {
        final recipes = await repository.retreiveRecipe(
          recipeFilters: event.recipeFilters,
        );
        yield RecipeLoadSuccess(recipes: recipes);
      } catch (error) {
        yield RecipeLoadFailure();
      }
    }
  }
}
