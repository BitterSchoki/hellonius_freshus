import 'recipe/api/recipe_api_client.dart';
import 'recipe/models/recipe.dart';
import 'recipe/models/recipe_filters.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> retreiveRecipe({
    required RecipeFilters recipeFilters,
  });
}

class ConnectedRecipeRepository extends RecipeRepository {
  ConnectedRecipeRepository({
    required this.recipeApiClient,
  });

  final RecipeApiClient recipeApiClient;

  @override
  Future<List<Recipe>> retreiveRecipe({
    required RecipeFilters recipeFilters,
  }) async {
    return recipeApiClient.retreiveRecipe(recipeFilters: recipeFilters);
  }
}
