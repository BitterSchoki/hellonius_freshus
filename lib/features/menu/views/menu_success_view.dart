import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/joy_recipe_item.dart';
import '../../../repositores/recipe/models/recipe.dart';
import '../../../themes/colors.dart';

class MenuSuccessView extends StatelessWidget {
  const MenuSuccessView({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: BrandColors.brand400,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore Recipes",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Badge(
                        label: Text("2"),
                        child: Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...recipes
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
