import 'recipe/api/recipe_api_client.dart';
import 'recipe/models/recipe.dart';

abstract class RecipeRepository {
  Future<Recipe> retreiveRecipe();
}

class ConnectedRecipeRepository extends RecipeRepository {
  ConnectedRecipeRepository({
    required this.recipeApiClient,
  });

  final RecipeApiClient recipeApiClient;

  @override
  Future<Recipe> retreiveRecipe() {
    return recipeApiClient.retreiveRecipe();
  }
}
