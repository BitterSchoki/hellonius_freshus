import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/recipe.dart';
import 'recipe_api_endpoints.dart';
import 'recipe_api_errors.dart';

class RecipeApiClient {
  const RecipeApiClient();

  Future<Recipe> retreiveRecipe() async {
    try {
      final url = Uri.parse(RecipeApiEndpoint.recipe);
      final response = await http.post(url, body: {});

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      final recipe = Recipe.fromJson(json);
      return recipe;
    } catch (e) {
      throw ExampleHttpFailure();
    }
  }
}
