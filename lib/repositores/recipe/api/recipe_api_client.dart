import 'dart:convert';

import 'package:hellonius_freshus/repositores/recipe/models/recipe_filters.dart';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';
import 'recipe_api_endpoints.dart';
import 'recipe_api_errors.dart';

class RecipeApiClient {
  const RecipeApiClient();

  Future<List<Recipe>> retreiveRecipe({
    required RecipeFilters recipeFilters,
  }) async {
    try {
      final url = Uri.parse(RecipeApiEndpoint.recipeFilter);

      final recipeFiltersJson = jsonEncode(recipeFilters.toJson());
      print(recipeFiltersJson);
      final response = await http.post(
        url,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: recipeFiltersJson,
      );

      final whatever = jsonDecode(response.body) as List<dynamic>;

      print(response.body);

      return whatever.map((e) => Recipe.fromJson(e)).toList();
    } catch (e) {
      throw ExampleHttpFailure();
    }
  }
}
