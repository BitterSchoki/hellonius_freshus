import 'package:flutter/material.dart';

import '../../../components/joy_recipe_item.dart';
import '../../../repositores/recipe/models/recipe.dart';

class MenuSuccessView extends StatelessWidget {
  const MenuSuccessView({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: recipes
            .map(
              (recipe) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: JoyRecipeItem(
                  recipe: recipe,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
